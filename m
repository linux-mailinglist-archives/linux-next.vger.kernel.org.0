Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59BD531D733
	for <lists+linux-next@lfdr.de>; Wed, 17 Feb 2021 11:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbhBQKAd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Feb 2021 05:00:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbhBQKAa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Feb 2021 05:00:30 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA47C06174A;
        Wed, 17 Feb 2021 01:59:50 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id t25so8183917pga.2;
        Wed, 17 Feb 2021 01:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U7SfXVPuTP/KtJpCtQU42RjJKMn82tTLAowjEG2x4Ds=;
        b=J0j9cOFjTF3pDIznsbrvoXaJP/5OqFxDAPVGg/FxlJYiHWcXLGNOdhwUu5rcirAHOV
         4aHU3PePKxYkQk3NVXjXJ/gnorJd31kIvDcpsgWqQlpHFLl1lz/3OuFBissCD2Uscjl9
         vDeBBM8IST3IFTO4mapjucnes2+W3xplH1cg5zjSLQ1/bsAUGmhWIBDJeyvofZcsfb2i
         n0FdKX0oUXQltQkmEHzMcy5T0KQBSkmG7aKDvFu2eOfxFzQiL01KcD+GXBaSS4VcRcdn
         9T6mgEUckO7THYoJtGqlCnoU74vX4yO9aRisTl9gaP+3h7tENSHYNYTeTrQ2+4cdslvx
         6vsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U7SfXVPuTP/KtJpCtQU42RjJKMn82tTLAowjEG2x4Ds=;
        b=jQFHFw6JaG/ZDk68OI6bG7zGaNxjKEGpzZj0sKi1jw2M4TqyKZsn2mwQ1gDL4upeB0
         GDtoziBZct/hPfGRUuygdhnk+6Ie3V1bofzxQzT9UYCjcUbd1/uU/nFOBy0rrObuANQg
         E5kpfJqCz04K2dwVTv3hB90QEbLVTFrDiEBlOUoJbQNMcyOeJMlQoK5xCIe4CmvHbIoW
         zgjTBMg8e2WlECMnLK+3Rhpdmln7T1EkYfe1eOsDdA2tSDUnfDSgwnJuqCR2A6mtWJM5
         JxFlS0PxRsRAV+Mxpg7+ZdyyOfQTF50m8wlWS0q3NApThHQTkgyHrmLxQJ2CETuXPmR8
         8vAg==
X-Gm-Message-State: AOAM530+p38fl0fwQ+y7vo7wHtP3ofKb8uulUgUQZB+Oyfx7PZN2nctY
        clVN5jI3D4BXIfJOryjmf8p+y1axFJqDDXxJdeUiPay0LC9pNQ==
X-Google-Smtp-Source: ABdhPJwyASzfs+76tCL85GTNa/uSjIXIUkgPW0bfGzKmj6Z83o3Ry4y2DpOcbsCnNG6fB1S5bNAsxugVw1j3+KaxhUs=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr14935565pgq.203.1613555990217;
 Wed, 17 Feb 2021 01:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20210217120617.61b22e5e@canb.auug.org.au>
In-Reply-To: <20210217120617.61b22e5e@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 17 Feb 2021 11:59:34 +0200
Message-ID: <CAHp75Ve54gR54b5bTozqEVFogaGBE8UsuPbvJD4Ozr0wT27tRA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pm tree with the i3c tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 17, 2021 at 4:11 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the pm tree got a conflict in:
>
>   MAINTAINERS
>
> between commit:
>
>   f06a1af8e739 ("MAINTAINERS: Add Silvaco I3C master")
>
> from the i3c tree and commit:
>
>   4590d98f5a4f ("sfi: Remove framework for deprecated firmware")
>
> from the pm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks!
Looks good to me!

> diff --cc MAINTAINERS
> index fdb32f96ede9,f7ec274a3e5a..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -16221,21 -16235,6 +16218,14 @@@ S: Maintaine
>   F:    Documentation/fb/sm712fb.rst
>   F:    drivers/video/fbdev/sm712*
>
>  +SILVACO I3C DUAL-ROLE MASTER
>  +M:    Miquel Raynal <miquel.raynal@bootlin.com>
>  +M:    Conor Culhane <conor.culhane@silvaco.com>
>  +L:    linux-i3c@lists.infradead.org
>  +S:    Maintained
>  +F:    Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
>  +F:    drivers/i3c/master/svc-i3c-master.c
>  +
> - SIMPLE FIRMWARE INTERFACE (SFI)
> - S:    Obsolete
> - W:    http://simplefirmware.org/
> - F:    arch/x86/platform/sfi/
> - F:    drivers/sfi/
> - F:    include/linux/sfi*.h
> -
>   SIMPLEFB FB DRIVER
>   M:    Hans de Goede <hdegoede@redhat.com>
>   L:    linux-fbdev@vger.kernel.org



-- 
With Best Regards,
Andy Shevchenko
