# Swinject workshop

## DI and terminology

Swinject documentation has a quite good start on this. [Link](https://github.com/Swinject/Swinject/blob/master/Documentation/DIContainer.md#di-container)

## Basic registrations - 0

_Let's say we are creating an app for a bakery store. Silly I know, but for this workshop we will stick to this example. This bakery sells it's own products, some sandwiches made of these and hot drinks. They even have menus just to encourage people to come in the morning and have a breakfast for example._

![](./Bakery_0.png)

1. Register a default product (_MARK-0-1_). Let's say we think that the most common product is a simple bread:

```
container.register(Product.self) { _ in
    Bread(flour: .bread)
}
```

2. Register a default sandwich (_MARK-0-2_). 

