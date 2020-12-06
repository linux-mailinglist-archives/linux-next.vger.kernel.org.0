Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C272D0813
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 00:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728429AbgLFXlA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Dec 2020 18:41:00 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:35947 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726046AbgLFXk7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Dec 2020 18:40:59 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 73F0B873;
        Sun,  6 Dec 2020 18:39:53 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Sun, 06 Dec 2020 18:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=yVz49w6dBGC6v3E7hwG+CfEV1vr4UEf
        UmR6rrVcGyQE=; b=pho6Q2rTBH8WpiUyEc2biqvdGX3LG/W66ThuC8eRlYdFM1h
        IIZaTISXojaIXLH3RNHmIPDqdS02K2TA6Ds8m0IoVzfhp3kw7aVZMz0apsoDWwG1
        S0QPDH7AfGAVhmtPD6qFSx0///3b6YQzbfiFsfLIHKlQSGniFjF1Lqgq5OowWJdf
        5lGz6714/yChr5XQJNoQ68QMyXJ5os0OCTU/p+K0GWh2U3n5bu70OzIEI6g6I1IE
        qB4uRUS8rDAg8XC2huA0AU8MyZWr545ZPzYokRd0ebomsP5Qi85hiqG4G3NAcdFY
        R6TE/l8XBvfbeNXWLsWYudK2k+ReexMmwEvcU+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yVz49w
        6dBGC6v3E7hwG+CfEV1vr4UEfUmR6rrVcGyQE=; b=XUTy3JbYp04ut9nhwR5Xt5
        8ojw2SKAPBuud9WgPHloFT9hypTAmi2oAB2S63CLQ0En2zKm9PQ3JXXG3Zh+hZWc
        JaF/EplNx61OZUYLP7UduWsGEYIrwmlmw0/pdycrOKnGyQ3fZgp89gdxwpIbeUek
        ko8M4zylYEs4i7dceDUzsOFWp6ueqSI5h1eTKXVne2/Cvsm7xVtwNEJX2ixAsY3U
        BhHebLRfVwlmivn0kLh31gDwdEAIqPf5nY2k0AfOMYYeBDI1FdBy9Nml+VmaljKV
        sACsnqVfEvaeXMzVagPSRNAwLh4IeXEPfHu1+DKnRDOj7F2y+4DXS7ymIVqtrXvQ
        ==
X-ME-Sender: <xms:x2vNX93M3l7U_3M6josRvgGnJjtVn-ote3facin7Ylu0fuSpFeWfdg>
    <xme:x2vNX0HknVqJWCLZmtOX2SKcqSFOha3S_PfKIXxQ9H10zwut9AFAJhQtK09AsplQR
    j9ISRRukVViPYstuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejfedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:x2vNX97tmDE1rCIFM-da3j-8SYrEn-kx8ZamCZOo07Mx4QkcokPIzg>
    <xmx:x2vNX60nXpX4RMFwrAxyBjIFUdyMM0n9a1w0oy0FymU--MnBlpAkRQ>
    <xmx:x2vNXwEXfAbpFHcWCfoAWzPlwDJ6triJVQ1yUmrEXmdOpkAvSa7ePQ>
    <xmx:yWvNX1SjOJep_Rf3LVvwxRWgZl40Qt-o-VXF8ousl2PMDMFLD1LZ5w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8563DE00DF; Sun,  6 Dec 2020 18:39:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <3f182394-8cf9-4d50-854e-cdcc33621b5f@www.fastmail.com>
In-Reply-To: <20201207071649.272eba1e@canb.auug.org.au>
References: <20201207071649.272eba1e@canb.auug.org.au>
Date:   Mon, 07 Dec 2020 10:09:23 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Stephen Rothwell" <sfr@canb.auug.org.au>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Joel Stanley" <joel@jms.id.au>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On Mon, 7 Dec 2020, at 06:46, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   c3c882898d07 ("pinctrl: aspeed: Fix GPIO requests on pass-through banks")
> 
> Fixes tag
> 
>   Fixes: 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 9b92f5c51e9a ("pinctrl: aspeed: Fix GPI only function problem.")

Right, looks like I accidentally grabbed 6726fbff19bf from the 5.9 stable tree.

Thanks for picking that up.

Andrew
