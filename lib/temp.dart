body: Form(
        key: _form,
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: 'Title',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _editedProduct = Product(
                    isFavorite: _editedProduct.isFavorite,
                    id: _editedProduct.id,
                    title: value,
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Provide a value';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: 'Price',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _editedProduct = Product(
                    isFavorite: _editedProduct.isFavorite,
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    price: double.parse(value),
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter a Price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  if (double.parse(value) == 0) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  labelText: 'Description',
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  _editedProduct = Product(
                    isFavorite: _editedProduct.isFavorite,
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    description: value,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Description';
                  }
                  if (value.length < 10) {
                    return 'Should be atleast 10 character  long';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text(
                            'Enter ImageURL',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).errorColor,
                                fontWeight: FontWeight.bold),
                          )
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        // border: const OutlineInputBorder(
                        //   borderRadius: const BorderRadius.all(
                        //     Radius.circular(8),
                        //   ),
                        //   borderSide: BorderSide(color: Colors.purple),
                        // ),
                        labelText: 'ImageURL',
                      ),
                      focusNode: _imageUrlFocusNode,
                      controller: _imageUrlController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      onFieldSubmitted: (_) => {_saveForm()},
                      onSaved: (value) {
                        _editedProduct = Product(
                          isFavorite: _editedProduct.isFavorite,
                          id: _editedProduct.id,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl: value,
                        );
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the link';
                        }
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'Please enter a valid URL.';
                        }
                        if (!value.endsWith('.png') &&
                            !value.endsWith('.jpg') &&
                            !value.endsWith('.jpeg')) {
                          return 'Please enter a valid image URL.';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),