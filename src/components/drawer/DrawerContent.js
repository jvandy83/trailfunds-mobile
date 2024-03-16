import { Pressable, View, Text, StyleSheet, Image } from "react-native";

import { useAuth0 } from "react-native-auth0";

import { PrimaryButton } from "../../reduxStore/styles/frontendStyles";

import { profilePic } from "../../assets/images";

export const CustomDrawerContent = (props) => {
  const { clearCredentials } = useAuth0();

  return (
    <View style={styles.customContentContainer}>
      <View style={styles.header}>
        <View>
          <View
            style={{
              alignItems: "center",
              paddingTop: 40,
            }}
          >
            <Image
              source={profilePic}
              style={{
                width: 150,
                height: 150,
                borderRadius: 100,
                overflow: "hidden",
              }}
              resize="center"
            ></Image>
          </View>
          <Text style={styles.headerText}>Jared</Text>
          {/* <Text style={styles.headerText}>{data.firstName}</Text> */}
        </View>
      </View>
      <View style={styles.navigation}>
        <Pressable
          style={styles.contentItem}
          onPress={() => {
            // Navigate using the `navigation` prop that you received
            props.navigation.navigate("Home");
          }}
        >
          <Text className="font-primary-400 text-lg">Home</Text>
        </Pressable>
        <Pressable
          style={styles.contentItem}
          onPress={() => {
            // Navigate using the `navigation` prop that you received
            props.navigation.navigate("Wallet");
          }}
        >
          <Text className="font-primary-400 text-lg">Wallet</Text>
        </Pressable>
        <Pressable
          style={styles.contentItem}
          onPress={() => {
            // Navigate using the `navigation` prop that you received
            props.navigation.navigate("Map");
          }}
        >
          <Text className="font-primary-400 text-lg">Map</Text>
        </Pressable>
        <Pressable
          style={styles.contentItem}
          onPress={() => {
            // Navigate using the `navigation` prop that you received
            props.navigation.navigate("About");
          }}
        >
          <Text className="font-primary-400 text-lg">About Trail Funds</Text>
        </Pressable>
        <Pressable
          style={styles.contentItem}
          onPress={() => {
            // Navigate using the `navigation` prop that you received
            props.navigation.navigate("Help");
          }}
        >
          <Text className="font-primary-400 text-lg">Help</Text>
        </Pressable>
      </View>
      <View style={styles.footer}>
        <PrimaryButton
          onPress={() => clearCredentials()}
          text="Sign Out"
          color="white"
        />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  customContentContainer: {
    flex: 1,
  },
  header: {
    paddingVertical: 40,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#59C092",
  },
  headerImage: {
    width: 110,
    height: 110,
  },
  headerText: {
    textAlign: "center",
    fontSize: 20,
    fontWeight: "bold",
    paddingTop: 24,
  },
  contentItem: {
    //...
    width: "100%",
    paddingLeft: 24,
    paddingVertical: 16,
    borderBottomWidth: 0.5,
    borderBottomColor: "grey",
  },
  contentText: {
    fontSize: 16,
    fontWeight: "bold",
  },
  footer: {
    flex: 1,
    height: 100,
    alignItems: "center",
    justifyContent: "center",
  },
});
