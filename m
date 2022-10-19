Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5522A603996
	for <lists+linux-next@lfdr.de>; Wed, 19 Oct 2022 08:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiJSGIz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Oct 2022 02:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJSGIz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Oct 2022 02:08:55 -0400
X-Greylist: delayed 1799 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 18 Oct 2022 23:08:52 PDT
Received: from 18.mo583.mail-out.ovh.net (18.mo583.mail-out.ovh.net [178.33.45.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B945B6583F
        for <linux-next@vger.kernel.org>; Tue, 18 Oct 2022 23:08:52 -0700 (PDT)
Received: from player698.ha.ovh.net (unknown [10.109.156.41])
        by mo583.mail-out.ovh.net (Postfix) with ESMTP id 754C525387
        for <linux-next@vger.kernel.org>; Wed, 19 Oct 2022 05:32:03 +0000 (UTC)
Received: from RCM-web6.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player698.ha.ovh.net (Postfix) with ESMTPSA id 177242FD2CF4E;
        Wed, 19 Oct 2022 05:31:57 +0000 (UTC)
MIME-Version: 1.0
Date:   Wed, 19 Oct 2022 07:31:57 +0200
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Richard Weinberger <richard.weinberger@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: linux-next: manual merge of the mtd tree with the mtd-fixes tree
In-Reply-To: <20221019092812.7d370b06@canb.auug.org.au>
References: <20221019092812.7d370b06@canb.auug.org.au>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <23d311953ef13608be2283a05b2e853d@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10075396791477512996
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelfedgleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpeftrghfrghlpgfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeegvdffjeelvdeggeetheegveejieetgeeiiefggeelveejffehieekhfduueelhfenucfkphepuddvjedrtddrtddruddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgrfhgrlhesmhhilhgvtghkihdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 2022-10-19 00:28, Stephen Rothwell wrote:
> Today's linux-next merge of the mtd tree got a conflict in:
> 
>   drivers/mtd/mtdcore.c
> 
> between commit:
> 
>   12b58961de0b ("mtd: core: add missing of_node_get() in dynamic
> partitions code")
> 
> from the mtd-fixes tree and commit:
> 
>   63db0cb35e1c ("mtd: core: simplify (a bit) code find
> partition-matching dynamic OF node")
> 
> from the mtd tree.
> 
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

this isn't exactly the correct fix, of_node_get() is still needed.

I'll make sure we let Linus know about this conflict (and solution) when
sending 6.2 pull request.


diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 07249af4f890..20fcedc3021e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -559,7 +559,7 @@ static void mtd_check_of_node(struct mtd_info *mtd)
  	if (!mtd_is_partition(mtd))
  		return;

-	parent_dn = mtd_get_of_node(mtd->parent);
+	parent_dn = of_node_get(mtd_get_of_node(mtd->parent));
  	if (!parent_dn)
  		return;

