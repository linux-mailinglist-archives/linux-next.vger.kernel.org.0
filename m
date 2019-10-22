Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFE5E0ACA
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 19:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfJVRj3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Oct 2019 13:39:29 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41415 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726569AbfJVRj3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Oct 2019 13:39:29 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D7AE922087;
        Tue, 22 Oct 2019 13:39:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 22 Oct 2019 13:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=baQW0mxKH2cZVXvaeNzt6ZclcCk
        uKhAc2/nHWENB1x8=; b=o2eFswaWfbJMI+SwZ8Mn9QghA7XNSNx4z9xy4eBhXHU
        AAP95MDPjmUZv71MK+5UmXe/KMjxXL+wUGiM0P7t/ptftHzF2VS2eKQ+h9tDqa3j
        4BTbTlj7TQv0YG6i1WnOFz5f+A32jBuu78xgLcMnLwIcBxOkiif+LwwvifvCc9sA
        3sMEVMcD1DyXezqoo3MJnqpfSpz6bXVWALXk/yK+ZXAuTxOVGirgZGBV443Fui1Y
        vtGRDl2r5S6n0zz0sC6fdH7eEnwTkqoj2GzTVmnCzFDTvB0wwy/3b4/1ufIcETKv
        woS1E0QOi/07WkyQWAAQxfkF2zBRFxS3dmwAaso2WTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=baQW0m
        xKH2cZVXvaeNzt6ZclcCkuKhAc2/nHWENB1x8=; b=C6DrrfhhAGd6Q6neDWk2xr
        24D078Fa4KMpJZUD+sDWdBBwWDR3Y1KrExTt5UtawLi4EBt0WVXyyVWcI3ZKUbQk
        7lSfhGIvs4FATvxDCKjwV7IjQNUt1OpoIe3ZxjovPKqale8rCW3Tkw8pdqZUtncG
        NSQb4Iw77S9CoiEa3KBqjELEXf6o/xa1MekghYuAHYwyWHoCNJNq7SXoshDV+hWu
        tOPDp382PLTj27CFftAYphjSZA3QO7M8PYGFmOi2RsHUZq42Jp313pvvn+7RRJNy
        hhPJyqeSvEQWeSCIaIwZcKQnYchEmwl9yg1AhtoLa0E74+y9lQhhk2EDtqqM30Ww
        ==
X-ME-Sender: <xms:zj6vXYbK2Fq1Y5VVGxzE177dwwU-lvg0IgBk_VB6w2oDlnv2u-XjTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdduudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeduieeirddujedvrdduke
    eirdehieenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
    necuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:zj6vXYEYq6S225N6sYZvjimneWVIUil25gVcs2tnxz9WZijlwob--A>
    <xmx:zj6vXfxwuRWmsZj4xzzgqG05_XPbzw9UIiKNBYZISsl1KQuMInjvFA>
    <xmx:zj6vXfj2Qckgf5v_yq-s2TxKIOe0g23wXFHtG3YSeE4r5ZWMg4VQOg>
    <xmx:zz6vXUp0m-MKtt5-PE1bZZenumIXirO2_UoW5RGXL6zzKElZaZopEQ>
Received: from localhost (mobile-166-172-186-56.mycingular.net [166.172.186.56])
        by mail.messagingengine.com (Postfix) with ESMTPA id D2CE180061;
        Tue, 22 Oct 2019 13:39:25 -0400 (EDT)
Date:   Tue, 22 Oct 2019 13:39:24 -0400
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomas Winkler <tomas.winkler@intel.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the keys tree
Message-ID: <20191022173924.GG230934@kroah.com>
References: <20191022133804.32ef6f86@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022133804.32ef6f86@canb.auug.org.au>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 22, 2019 at 01:38:04PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got conflicts in:
> 
>   samples/Kconfig
>   samples/Makefile
> 
> between commit:
> 
>   0b9c31597d81 ("Add sample notification program")
> 
> from the keys tree and commit:
> 
>   6859eba4f6fb ("samples: mei: use hostprogs kbuild constructs")
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
> diff --cc samples/Kconfig
> index d0761f29ccb0,b663d9d24114..000000000000
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@@ -169,11 -169,11 +169,17 @@@ config SAMPLE_VF
>   	  as mount API and statx().  Note that this is restricted to the x86
>   	  arch whilst it accesses system calls that aren't yet in all arches.
>   
>  +config SAMPLE_WATCH_QUEUE
>  +	bool "Build example /dev/watch_queue notification consumer"
>  +	depends on HEADERS_INSTALL
>  +	help
>  +	  Build example userspace program to use the new mount_notify(),
>  +	  sb_notify() syscalls and the KEYCTL_WATCH_KEY keyctl() function.
>  +
> + config SAMPLE_INTEL_MEI
> + 	bool "Build example program working with intel mei driver"
> + 	depends on INTEL_MEI
> + 	help
> + 	  Build a sample program to work with mei device.
> + 
>  -
>   endif # SAMPLES
> diff --cc samples/Makefile
> index a61a39047d02,d6062ab25347..000000000000
> --- a/samples/Makefile
> +++ b/samples/Makefile
> @@@ -20,4 -20,4 +20,5 @@@ obj-$(CONFIG_SAMPLE_TRACE_PRINTK)	+= tr
>   obj-$(CONFIG_VIDEO_PCI_SKELETON)	+= v4l/
>   obj-y					+= vfio-mdev/
>   subdir-$(CONFIG_SAMPLE_VFS)		+= vfs
>  +subdir-$(CONFIG_SAMPLE_WATCH_QUEUE)	+= watch_queue
> + obj-$(CONFIG_SAMPLE_INTEL_MEI)		+= mei/


Looks good to me, thanks!

greg k-h
