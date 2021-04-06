Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF70E35563E
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 16:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244411AbhDFOPx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 10:15:53 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40473 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244391AbhDFOPx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 10:15:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 558915C0198;
        Tue,  6 Apr 2021 10:15:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 06 Apr 2021 10:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=Df60/D28v21JXoc5V1rC9GHtmmL
        qCuwl38fCVV5rIdo=; b=tghY3MwOGS9LDjx/lOYVs2sO8q7LgfXQ50yPEZKdJOc
        jJ6dogfjYqMCsBwKXKCvpo8DBXs2wU59wohrP6VQD2Nc1lF4yiLlg4rmjRzJkLy+
        bUfbWj8vp2hxL1pd9X1Nlz4iVQNCK/xdgfgTic1rN2jsnFNTc7i/oWo/UzMkijOa
        Y5HfG0bf2m3tTNKQo5XHLjx/JLwML5GYf2guzZHPs+FkJqnve7FHF92G7IGHkGEy
        fBdRCT30oMKHZAEO4ie7Rs/vEXCgNRo/aaYV7mCHj9WXGIuQ/eSsfOebZCQZieHN
        gUlnRYSc8eWSJhstTzjQaghYGT7yGBWKHwLNKJsonrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Df60/D
        28v21JXoc5V1rC9GHtmmLqCuwl38fCVV5rIdo=; b=RvRqE73zFwp5yOc706DaRN
        XQdrF8kwZUPGJJyn6YR91pG6lAwMP8K/Qd0FubRBBvCoQlTAh6OZRPIq4kAdP+0V
        ge2nK16aU2ntWCCt+hAXqCRKpUlXT9ERosIfa1ktoaTBANxXNTfuAFmbi30I2Urp
        f52hG9NoAPPLHCSpNfP4GDgT0pcaRo3x9I1Y+2XYgSUbKAh5cvt1bbSTvv84c7WR
        xmWVt3XyNfkr7CCIMpEVhyojeX2inO27bRz5iAuGAKgUF2OhK8Sw2v4lpuWMz2Yf
        iQUXYl0MBXrRsgRgOIMDuEOVAVpEJR5u8VdsDSvp5T5mommqZC6WvtNFxViwFCCA
        ==
X-ME-Sender: <xms:D21sYGHqNC6V9nHJV_NIDJMzC9rOnmOb5SbfmFWaOzTCpu7l8Xv8kw>
    <xme:D21sYFQ5wLzmnseNdz_e8U5mphoY4jBbaAOJgfSskUj3X2JQMg6LdKUYBiwnUn2kn
    0TUPbAryJY9Bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:D21sYCciO7ooRMi5q0_XUrW2vNT5VzQ86ReREwSmoC9WynW9eF_cgQ>
    <xmx:D21sYErvkwKldR7Z1jxqJ6WathZvLdCPSOj9fxxNsDvLd6JTSa1xUw>
    <xmx:D21sYD_OHqoy87iQzUBPgkPVYNvUkvcYSzLMpLeCxF037rPiQGxowg>
    <xmx:EW1sYF5OL0u0Y4zkQGikWa8Eldt5iNXZ6oFuy3lxbSUgc0Q0rxNdLA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2998D24005D;
        Tue,  6 Apr 2021 10:15:43 -0400 (EDT)
Date:   Tue, 6 Apr 2021 16:15:40 +0200
From:   Greg KH <greg@kroah.com>
To:     Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Message-ID: <YGxtDDm7nV1AuTqo@kroah.com>
References: <20210406214441.5744648c@canb.auug.org.au>
 <YGxrG16+8n8Wxs/c@kroah.com>
 <DM5PR12MB18350439051E4E90BD0287F4DA769@DM5PR12MB1835.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM5PR12MB18350439051E4E90BD0287F4DA769@DM5PR12MB1835.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 06, 2021 at 02:13:53PM +0000, Gustavo Pimentel wrote:
> On Tue, Apr 6, 2021 at 15:7:23, Greg KH <greg@kroah.com> wrote:
> 
> > On Tue, Apr 06, 2021 at 09:44:41PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the char-misc tree, today's linux-next build (htmldocs)
> > > produced this warning:
> > > 
> > > Documentation/misc-devices/dw-xdata-pcie.rst:20: WARNING: Unexpected indentation.
> > > Documentation/misc-devices/dw-xdata-pcie.rst:24: WARNING: Unexpected indentation.
> > > Documentation/misc-devices/dw-xdata-pcie.rst:25: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > Documentation/misc-devices/dw-xdata-pcie.rst:30: WARNING: Unexpected indentation.
> > > Documentation/misc-devices/dw-xdata-pcie.rst:34: WARNING: Unexpected indentation.
> > > Documentation/misc-devices/dw-xdata-pcie.rst:35: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > Documentation/misc-devices/dw-xdata-pcie.rst:40: WARNING: Unexpected indentation.
> > > 
> > > Introduced by commit
> > > 
> > >   e1181b5bbc3c ("Documentation: misc-devices: Add Documentation for dw-xdata-pcie driver")
> > 
> > Gustavo, can you send a follow-on patch to fix this up?
> 
> Yes, I have already made a fix for it.
> My apologies for my ignorance on this matter, there is some way to check 
> if my fixes are okay through some script or other way as Stephen has 
> done?

Yes, run 'make htmldocs' in the kernel tree with your change applied and
see if the warnings go away.

thanks,

greg k-h
