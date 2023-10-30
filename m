Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 966857DB438
	for <lists+linux-next@lfdr.de>; Mon, 30 Oct 2023 08:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbjJ3H0o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Oct 2023 03:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbjJ3H0m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Oct 2023 03:26:42 -0400
X-Greylist: delayed 1203 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 30 Oct 2023 00:26:38 PDT
Received: from 6.mo576.mail-out.ovh.net (6.mo576.mail-out.ovh.net [46.105.50.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5924EA7
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 00:26:38 -0700 (PDT)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.138.180])
        by mo576.mail-out.ovh.net (Postfix) with ESMTP id AA6FB24CEE
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 06:46:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-b2mgz (unknown [10.110.208.235])
        by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 30EC41FE5D;
        Mon, 30 Oct 2023 06:46:36 +0000 (UTC)
Received: from RCM-web2.webmail.mail.ovh.net ([176.31.232.109])
        by ghost-submission-6684bf9d7b-b2mgz with ESMTPSA
        id qU0XH0xRP2WXaAAAINcnSg
        (envelope-from <rafal@milecki.pl>); Mon, 30 Oct 2023 06:46:36 +0000
MIME-Version: 1.0
Date:   Mon, 30 Oct 2023 07:46:36 +0100
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the nvmem tree
In-Reply-To: <20231030151024.35d0910c@canb.auug.org.au>
References: <20231030151024.35d0910c@canb.auug.org.au>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <3237d305e6b61a8113771ce0b9151867@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5858338691129322365
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrleelgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeejvdelgfeutdfhfeelheegfedtleduleeuvdfgfeefvefhvedtheetjeetfeehgeenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpudejiedrfedurddvfedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgrfhgrlhesmhhilhgvtghkihdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 2023-10-30 05:10, Stephen Rothwell wrote:
> The following commit is also in char-misc tree as a different commit
> (but the same patch):
> 
>   ca7384334d9b ("Revert "nvmem: add new config option"")
> 
> This is commit
> 
>   f4cf4e5db331 ("Revert "nvmem: add new config option"")
> 
> in the char-misc tree.

please ignore patch in nvmem.git, it's an old version applied on top of
outdated code.

Code in char-misc.git which is meant to go to Linus is all good, we're
all safe :)

-- 
Rafał Miłecki
