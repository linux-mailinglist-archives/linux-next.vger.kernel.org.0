Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0A4DC211
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 12:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbfJRKGa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Oct 2019 06:06:30 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:34863 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727249AbfJRKGa (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Oct 2019 06:06:30 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id DAF1245C;
        Fri, 18 Oct 2019 06:06:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 18 Oct 2019 06:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=CEbL1Ou53wBW7FNfcvRW/jSmuyM
        CL/eYbOQu4ZM+SBM=; b=DUS6vMwqQpKCVqCfonSG11TZj7+ugRM6CXsBmI0BVmh
        jtvur5OuR2HA1IREtQqGhEIwhwjh/z0ElVT9lYwsiK/L2vY1Khmc/aQ4HXp+USG4
        3Ggi2hWQHp8ToLoY3Pa4z6sAH17iqqyVW6K8GOA9rCioUe0cuM3e0gS+sE8sFTYo
        sH6YyXFc7IskN6YonLqTLR8vIkgGOrqEIqIRlQ8XnEuKe3LwPWSwdhbD/PSk/rHQ
        S32agTapJJyviRnwKcIibp6TI3RZloUU/y//KLGInE1LTSn7lFVqTJxywWhgfH2d
        JV3nk1OPlbEFAt8JFMs+E+yuxGhCz2QZ9I5ZZIBd2QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CEbL1O
        u53wBW7FNfcvRW/jSmuyMCL/eYbOQu4ZM+SBM=; b=vkYmvdLsPUBPVFtfyPT0pW
        h73Xq4okEbC+nGfLQdaJQl1v/qlYUyQ6bgcyWZ2QImy5+aR0kw9jCHzWQqTg6iUI
        Q7jTeeoxRD4OOclRmC9B1LidSFHtOK52hkhVrObSEkTEbrko1ALNfMgaqOMAYhcp
        OvRT++Ce+6uxi6z8VSd90lH66YgtlX1088L0Sd6tpZuVdFkcSOfJfRrvZ1Sl9/Za
        D7BeXNujpc1fu+1GzD0h+1blwGzkPP16ttUXLyQVX0AwWJXvRA6F4v/qSHl6jrim
        p4BiYK5TkDuF3XIARsGllVHVELZUfRJ7GZOBooOq8SfjA+P07M1KBDH7898Y0UIw
        ==
X-ME-Sender: <xms:o46pXY6-5UbYUk5i7rLqWYySsLH65oG4-bBg-Zacqh7vzgakIJ4AvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeelgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepvddtledrudefiedrvdefie
    drleegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:o46pXaPkyqKeiXos2Gud8jk5V0U2VH-xFLI2w5C-gpy6_wU1Tw2VCg>
    <xmx:o46pXfGunLeKR7EQ_Ll1EqDuzNBZeZoUYF7nJMqVR6BFILHvEG7lLw>
    <xmx:o46pXXy0QAGfKD4bgan3YhE5o1reNUHNvECzQqSiOcpIIp_xKC0vcg>
    <xmx:pI6pXdbqIGLpmGA4kv-RRYscaFTgBUxWgesr-2ih_f57Yno7_hXNJQ>
Received: from localhost (unknown [209.136.236.94])
        by mail.messagingengine.com (Postfix) with ESMTPA id 72C5180060;
        Fri, 18 Oct 2019 06:06:27 -0400 (EDT)
Date:   Fri, 18 Oct 2019 03:06:26 -0700
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jann Horn <jannh@google.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <20191018100626.GA1171555@kroah.com>
References: <20191018142616.7d6a7594@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018142616.7d6a7594@canb.auug.org.au>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 18, 2019 at 02:26:16PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/android/binder.c
> 
> between commit:
> 
>   45d02f79b539 ("binder: Don't modify VMA bounds in ->mmap handler")
> 
> from the char-misc.current tree and commit:
> 
>   990be7476485 ("binder: Use common definition of SZ_1K")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/android/binder.c
> index 265d9dd46a5e,bef788058bc3..000000000000
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@@ -92,11 -93,10 +93,6 @@@ static atomic_t binder_last_id
>   static int proc_show(struct seq_file *m, void *unused);
>   DEFINE_SHOW_ATTRIBUTE(proc);
>   
> - /* This is only defined in include/asm-arm/sizes.h */
> - #ifndef SZ_1K
> - #define SZ_1K                               0x400
>  -#ifndef SZ_4M
>  -#define SZ_4M                               0x400000
> --#endif
> --
>   #define FORBIDDEN_MMAP_FLAGS                (VM_WRITE)
>   
>   enum {

Yeah, sorry about this, I knew it would be a conflict, I'll handle it
when one of these branches gets merged to Linus's tree.

thanks,

greg k-h
