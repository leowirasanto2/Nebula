
## How to Use

### Adding Nebula via Swift Package Manager

1. Open your Xcode project.
2. Go to **File > Add Packages**.
3. Enter the repository URL for Nebula: `https://github.com/your-repo/Nebula.git`.
4. Choose the version or branch you want to use.
5. Click **Add Package** to integrate it into your project.

### Importing Nebula

After adding the package, you can import Nebula into your Swift files:

```swift
import Nebula
```

You're now ready to use Nebula in your project!

### Example Components

Here are some examples of components available in Nebula:

#### Example 1: Using the `PrimaryButton`

```swift
import Nebula

struct ContentView: View {
     var body: some View {
        PrimaryButton(title: "Click Me", size: .large, action: {
            print("Primary button tapped!")
        })
        }
    }
    ```

    #### Example 2: Using the `SecondaryButton`

    ```swift
    import Nebula

    struct ContentView: View {
        var body: some View {
        SecondaryButton(
            title: "Cancel",
            action: {
            print("Secondary button tapped!")
            },
            size: .medium,
            buttonType: .warning
        )
        .borderWidth(2)
        }
    }
    ```

    #### Example 3: Using `ColorToken`

    ```swift
    import Nebula

    struct ColorExampleView: View {
        var body: some View {
        Text("Styled Text")
            .colorToken(.labelDefault)
            .padding()
            .background(ColorToken.backgroundDefault.color)
            .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(ColorToken.borderDefault.color, lineWidth: 1)
            )
        }
    }
    ```

    #### Example 4: Using `Typography`

    ```swift
    import Nebula

    struct TypographyExampleView: View {
        var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            Text("Title Large").typography(.titleLarge)
            Text("Title Regular").typography(.titleRegular)
            Text("Body Medium").typography(.bodyMedium)
            Text("Caption Regular").typography(.captionRegular)
        }
        }
    }
    ```

    #### Example 5: Using `MSAInputField`

    ```swift
    import Nebula

    struct InputFieldExample: View {
        @State private var email = ""
        @State private var password = ""

        var body: some View {
        VStack(spacing: Spacing.large) {
            MSAInputField(
            text: $email,
            placeholder: "Email address",
            inputType: .email
            )

            MSAInputField(
            text: $password,
            placeholder: "Password",
            inputType: .password
            )
        }
        .padding()
        }
    }
    ```

    #### Example 6: Using `NebulaIllustration`

    ```swift
    import Nebula

    struct IllustrationExample: View {
        var body: some View {
        VStack {
            NebulaIllustration.businessDeal.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 200)

            Text("Business Deal Illustration")
            .typography(.subtitle)
        }
        }
    }
