Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1455F60A0
	for <lists+linux-next@lfdr.de>; Thu,  6 Oct 2022 07:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiJFFbu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Oct 2022 01:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbiJFFbs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Oct 2022 01:31:48 -0400
X-Greylist: delayed 1050 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 05 Oct 2022 22:31:46 PDT
Received: from 6.mo575.mail-out.ovh.net (6.mo575.mail-out.ovh.net [46.105.63.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FABF1F619
        for <linux-next@vger.kernel.org>; Wed,  5 Oct 2022 22:31:46 -0700 (PDT)
Received: from player693.ha.ovh.net (unknown [10.109.146.20])
        by mo575.mail-out.ovh.net (Postfix) with ESMTP id B1E1525A69
        for <linux-next@vger.kernel.org>; Thu,  6 Oct 2022 05:14:14 +0000 (UTC)
Received: from RCM-web4.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player693.ha.ovh.net (Postfix) with ESMTPSA id 77DD82F565B78;
        Thu,  6 Oct 2022 05:14:05 +0000 (UTC)
MIME-Version: 1.0
Date:   Thu, 06 Oct 2022 07:14:05 +0200
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-next <linux-next@vger.kernel.org>,
        ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: build warnings after merge of the broadcom tree
In-Reply-To: <20221006111725.01ed0eac@canb.auug.org.au>
References: <20220725095913.31e859ec@canb.auug.org.au>
 <df8f4765-a804-cb50-bbb5-475925ba2036@milecki.pl>
 <20220815105419.4df1005b@canb.auug.org.au>
 <20220831091654.45d5ed41@canb.auug.org.au>
 <20221005114841.4540d325@canb.auug.org.au>
 <abbe10d1-4c2a-5fad-3f92-e55c514d3ce2@gmail.com>
 <CACPK8Xecn8ZREAqcLcuZHjA=NhaanRMKu4W39okAkBFX4aaOnw@mail.gmail.com>
 <f8416a63-3460-4b43-8532-2d5eacea4457@app.fastmail.com>
 <20221006111725.01ed0eac@canb.auug.org.au>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d019295b10f2d84e945d8e55ecc52e4f@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7216455456440429336
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeigedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpeftrghfrghlpgfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeevjefhffffveeludejfedtvdfftdekgffghfegieeliedvfeeigfejteejjeekfeenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrheileefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeh
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2022-10-06 02:17, Stephen Rothwell wrote:
> On Wed, 05 Oct 2022 09:21:21 +0200 "Arnd Bergmann" <arnd@arndb.de> 
> wrote:
>> 
>> Agreed. Alternatively, we could just remove the pcie@ nodes from
>> bcm5301x as a hotfix, as they are clearly not usable in the
>> current form, and none of the three versions (5.19, Rafał's
>> patch missing ranges, and Florian's patch with incorrect ranges)
>> actually conform to the binding.
>> 
>> I'll tentatively apply the revert for now so I can send the pull
>> request tonight. If someone comes up with a better fix, I can
>> use that instead.
> 
> I applied the revert to the merge of the arm-soc tree today and *all*
> the warnings are gone.

As explained by Joel, there are dtc and yaml warnings.

Not "*all*" warnings are gone
dtc warnings are gone
yaml warnings are back

Which may be OK, just clarifying.
