const { SlashCommandBuilder } = require("discord.js")


module.exports = {
  data: new SlashCommandBuilder()
    .setName('randomizer')
    .setDescription('Random number'),
  async execute(interaction) {
    // interaction.user is the object representing the User who ran the command
    // interaction.member is the GuildMember object, which represents the user in the specific guild
    const randomNumberGen = () => {
      // generates a random number from 1 - 100
      const randomNumber = (Math.random() * 99) + 1

      const roundedRandomNumber = Math.round(randomNumber)

      return roundedRandomNumber
    }

    await interaction.reply(`Random Number: ${randomNumberGen()}`);
  },
};

