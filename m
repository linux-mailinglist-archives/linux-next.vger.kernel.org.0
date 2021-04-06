Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84AB9355A71
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 19:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbhDFRdp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 13:33:45 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:54671 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234742AbhDFRdp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 13:33:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id B1DFC5C0058;
        Tue,  6 Apr 2021 13:33:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 06 Apr 2021 13:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=lKW3+Kz2r3tCzE9CmGmOiirLpMq
        E5TAqeRkWaI12qbc=; b=er+B5LebyDyIdez4OkJnA1rY+fxOPahNm1VNyb14qXB
        QY+zoVlC4UXnWxqD5Lf6Q3uFWNKd4TW2kMaAlLZtn97dr+56zjN2dMsn7dZyKjyW
        9atB2R5fesm8DYm9nsnFoPXEURgTgkRXcxSrSMBiTQ66YEmRl8KBYJwcgmAGSvaq
        Fq9jx7pxJmII5goAiujF2TE9zpCT/7uQe/pIgu2EICmfyDreM91elSqFJjkKl+ZZ
        0APv/li8PA5sF/gJ0EXUpusx217yfgaeFgxqJwe3o36c0VSSxn2w58w1yUL2F2we
        HGY8E10UeQazeobWpU0S/Ri3gX/ZoQJDwoq2Z36uamA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lKW3+K
        z2r3tCzE9CmGmOiirLpMqE5TAqeRkWaI12qbc=; b=GqdGncb06QzwEame2zLYCW
        zIL13L21XdFHhCqG4C4A7zFlwmqhpCMpDQQhay+DZaKFBWPJcqhw58HOsHca3dZz
        GlU4oZB3ZBNddom9viVvMSOFw68M5GewauAsMolYxpmVpBONXuODYfKdmDStm+M7
        7bvqJoqii+sAXligazH/zqU9I9r0b0myMs52tbo6nc97COPR8chzQgTjWAgLbc/b
        q/limGsIuYVCQCCTpJodFIRcxGq/pDphgycbz/pC5ej0KwfYBcgYm5yyV1mtyPWe
        lWih/vqEssMRkwdH7yuohiuvHA86qHz91b/NpqGgwmgPcgYrQhrixBjnEMb6rKJA
        ==
X-ME-Sender: <xms:b5tsYPuwaxfcXjmyj2922LOATN7yT1nnPce2IM-yB0TXs5MIojViKQ>
    <xme:b5tsYAZetfPMsgBaujRJAKUKaZGFgOpUZW_VmvTduatC2PZTZPsiuIKHgiL1CTLt4
    pkRZmCNc06kZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:b5tsYPphXzk5vaXIqii9H8caPLrg1zBYTmE-vyXmq4wCiwT6U6BrHg>
    <xmx:b5tsYF9Axv9mAIecey_cFwNtajDLp39pu1Lqdwp_78a03jtJjUYfcg>
    <xmx:b5tsYO_L0c0hBJZu_H4qHSs-9LmeyblJ2GOsYZMzNdJsI7jlM2UG9Q>
    <xmx:cJtsYM60vB0ad8CpjHmaJGcuYZj4FUBUaXheyrigWBAcbRvBdpq2wQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 44E64108005F;
        Tue,  6 Apr 2021 13:33:35 -0400 (EDT)
Date:   Tue, 6 Apr 2021 19:33:33 +0200
From:   Greg KH <greg@kroah.com>
To:     Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Message-ID: <YGybbb/jFLRIrS6t@kroah.com>
References: <20210406214441.5744648c@canb.auug.org.au>
 <YGxrG16+8n8Wxs/c@kroah.com>
 <DM5PR12MB18350439051E4E90BD0287F4DA769@DM5PR12MB1835.namprd12.prod.outlook.com>
 <YGxtDDm7nV1AuTqo@kroah.com>
 <DM5PR12MB18350E4A7E4207611F9C93CFDA769@DM5PR12MB1835.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM5PR12MB18350E4A7E4207611F9C93CFDA769@DM5PR12MB1835.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 06, 2021 at 05:28:36PM +0000, Gustavo Pimentel wrote:
> On Tue, Apr 6, 2021 at 15:15:40, Greg KH <greg@kroah.com> wrote:
> 
> > On Tue, Apr 06, 2021 at 02:13:53PM +0000, Gustavo Pimentel wrote:
> > > On Tue, Apr 6, 2021 at 15:7:23, Greg KH <greg@kroah.com> wrote:
> > > 
> > > > On Tue, Apr 06, 2021 at 09:44:41PM +1000, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > > 
> > > > > After merging the char-misc tree, today's linux-next build (htmldocs)
> > > > > produced this warning:
> > > > > 
> > > > > Documentation/misc-devices/dw-xdata-pcie.rst:20: WARNING: Unexpected indentation.
> > > > > Documentation/misc-devices/dw-xdata-pcie.rst:24: WARNING: Unexpected indentation.
> > > > > Documentation/misc-devices/dw-xdata-pcie.rst:25: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > > > Documentation/misc-devices/dw-xdata-pcie.rst:30: WARNING: Unexpected indentation.
> > > > > Documentation/misc-devices/dw-xdata-pcie.rst:34: WARNING: Unexpected indentation.
> > > > > Documentation/misc-devices/dw-xdata-pcie.rst:35: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > > > Documentation/misc-devices/dw-xdata-pcie.rst:40: WARNING: Unexpected indentation.
> > > > > 
> > > > > Introduced by commit
> > > > > 
> > > > >   e1181b5bbc3c ("Documentation: misc-devices: Add Documentation for dw-xdata-pcie driver")
> > > > 
> > > > Gustavo, can you send a follow-on patch to fix this up?
> > > 
> > > Yes, I have already made a fix for it.
> > > My apologies for my ignorance on this matter, there is some way to check 
> > > if my fixes are okay through some script or other way as Stephen has 
> > > done?
> > 
> > Yes, run 'make htmldocs' in the kernel tree with your change applied and
> > see if the warnings go away.
> 
> Done. I submitted now the v11 with the fixes.

I can not take these as your patches are already in my public tree.  I
can revert the existing ones, but that's a mess, just send me a set of
patches to fix this issue, like you would for any future change to this
driver.

thanks,

greg k-h
