Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D80355615
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 16:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbhDFOHf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 10:07:35 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:50385 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233348AbhDFOHf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 10:07:35 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 82CC45C013A;
        Tue,  6 Apr 2021 10:07:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 06 Apr 2021 10:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=/0Wz5dj/+IJAQKiJXxZGuUsNcOc
        A/ivdlPyloiyjg7A=; b=C8Fx0OYhnahB2JZkXdAXd51Eo+c4hbTis0u4Rt35X0d
        Fh5mttaU3nWqutgKa+/KgaIOfcyuvIah8UQPG/PnNhbzpEdvVt3nIkzyeDr/wLEN
        5T6efiLYMKX7T1GaUSYE/qR+nePXzn1VKhJ17ZvoCLSDWO5IX4kgTEZk+kGjfXVb
        XqIySIlJ7nM7O5R1h7KV3oNZBFJVbI2XghiGCP+sJKBREu01LtnroRt+enExB6lE
        Ps7JYUALj2dkQmy9Wi4Wgtvu2SzaoDHq/pLw6qHjrbPk0z9ssJ9Un4ZTl25C+XuA
        G9owpdVvOHbR8wAhhn3IIxZDSFvruMYXUnAULzGjjag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/0Wz5d
        j/+IJAQKiJXxZGuUsNcOcA/ivdlPyloiyjg7A=; b=LocmciT57hPSRJ0mHcMZNG
        bFnXj9a/8fLRb+R5wlnTXHvBjEFkmveVBh9bjbZUhGz71wnAobf3yjEJ1Dus79CC
        rIuYGqQl6rjNy2zhWAlR95VE8+dNDGaLRszgzqXFbC1J/wsjKJxbWyrw3iryWTU8
        vZy1/xOOpcwop1Ed9YHMQACSr6dh78I8iifn3IrNxptbyCD1Bu25H7n12cB7peBf
        TAoM2fAbGBf8kYv5EgaGrC3TgDy6hofAHyYXBZ8bedQZmOtsOwTjazhgGzH+eV8H
        eIjvpb+qR9tBBZP4NbukvG5AAqLSx/ehf14eAOgh0mzyh2QpJWeyeOJFpmYj9nUA
        ==
X-ME-Sender: <xms:HmtsYOR9knLYNl34TX8LJs7Czk9f0dI-pi2BD0mu5yOvFKrQS_PZBA>
    <xme:HmtsYOV_lJk-RBmvtRuqxeT_bqM7ptxT8AwR51YvM88p3PeVFE7KAUvO8lXTsgego
    u9-h_rMCMOTbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:HmtsYIZAXiVaNIJuh3xc-WfKQDUpVCXqcNh-vfGOyzMNdDhn0EqIFw>
    <xmx:HmtsYM0S4_PXHuSkXONVm4omJ20Xdydj8C4TfDO0fPKEfqjkvlEEjw>
    <xmx:HmtsYCh9JUSuwGHfyQWCjA7YzByGrQaeiNgqFmjI-l_lZdi71qqTkg>
    <xmx:H2tsYFNC8u19bFVASUVltO8J1rl4c4g_x8Eyx6NZQe9iZtYHZypErg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0263524005E;
        Tue,  6 Apr 2021 10:07:25 -0400 (EDT)
Date:   Tue, 6 Apr 2021 16:07:23 +0200
From:   Greg KH <greg@kroah.com>
To:     Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Message-ID: <YGxrG16+8n8Wxs/c@kroah.com>
References: <20210406214441.5744648c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406214441.5744648c@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 06, 2021 at 09:44:41PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/misc-devices/dw-xdata-pcie.rst:20: WARNING: Unexpected indentation.
> Documentation/misc-devices/dw-xdata-pcie.rst:24: WARNING: Unexpected indentation.
> Documentation/misc-devices/dw-xdata-pcie.rst:25: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/misc-devices/dw-xdata-pcie.rst:30: WARNING: Unexpected indentation.
> Documentation/misc-devices/dw-xdata-pcie.rst:34: WARNING: Unexpected indentation.
> Documentation/misc-devices/dw-xdata-pcie.rst:35: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/misc-devices/dw-xdata-pcie.rst:40: WARNING: Unexpected indentation.
> 
> Introduced by commit
> 
>   e1181b5bbc3c ("Documentation: misc-devices: Add Documentation for dw-xdata-pcie driver")

Gustavo, can you send a follow-on patch to fix this up?

thanks,

greg k-h
