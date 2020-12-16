Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6402DB843
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 02:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgLPBL0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 20:11:26 -0500
Received: from mga06.intel.com ([134.134.136.31]:61055 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgLPBLZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Dec 2020 20:11:25 -0500
IronPort-SDR: AC7vtsAq5eHsvhgcxsNp0lKK0yvoBzDcv3Sm2k5Ozh42uh9STF/IL2RCkLrxab5+D8Vskqp7EB
 Bp4NdADi1C7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="236560119"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="236560119"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 17:09:38 -0800
IronPort-SDR: RU9tWlTsZCIOuXYyqvu9cECu6EZoHttatFgsVIZwtruFTVtcBbrZ/0/3IT6+IoHB60TAVdN/qk
 qWiQoArHUlyw==
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="556586381"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 17:09:38 -0800
Received: from localhost (mtg-dev.jf.intel.com [10.54.74.10])
        by smtp.ostc.intel.com (Postfix) with ESMTP id E77316363;
        Tue, 15 Dec 2020 17:09:37 -0800 (PST)
Date:   Tue, 15 Dec 2020 17:09:37 -0800
From:   mark gross <mgross@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Healy <mikex.healy@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>
Subject: Re: linux-next: manual merge of the drm tree with the crypto tree
Message-ID: <20201216010937.GA6517@linux.intel.com>
Reply-To: mgross@linux.intel.com
References: <20201214135453.16e76e9d@canb.auug.org.au>
 <CAMuHMdWYBLqUVRyNRbOZm=oxv+_uLJ9FK6ebPPvgHcN4Y-YUSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWYBLqUVRyNRbOZm=oxv+_uLJ9FK6ebPPvgHcN4Y-YUSQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 15, 2020 at 10:58:52AM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 14, 2020 at 2:44 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Today's linux-next merge of the drm tree got a conflict in:
> >
> >   MAINTAINERS
> >
> > between commit:
> >
> >   885743324513 ("crypto: keembay - Add support for Keem Bay OCS AES/SM4")
> >
> > from the crypto tree and commit:
> >
> >   ed794057b052 ("drm/kmb: Build files for KeemBay Display driver")
> >
> > from the drm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > diff --cc MAINTAINERS
> > index 3b358262de8f,eb18459c1d16..000000000000
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> 
> > @@@ -8985,16 -8962,13 +8993,23 @@@ M:   Deepak Saxena <dsaxena@plexity.net
> >   S:    Maintained
> >   F:    drivers/char/hw_random/ixp4xx-rng.c
> >
> > + INTEL KEEMBAY DRM DRIVER
> 
> Is it KEEMBAY?
> 
> > + M:    Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > + M:    Edmund Dea <edmund.j.dea@intel.com>
> > + S:    Maintained
> > + F:    Documentation/devicetree/bindings/display/intel,kmb_display.yaml
> 
> I was just going to comment about "intel,kmb_*" vs. "intel,keembay-*", until
> I noticed intel,kmb_display.yaml does not exist, but is called
> Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> in next-20201214.
> 
> > + F:    drivers/gpu/drm/kmb/
> > +
> >  +INTEL KEEM BAY OCS AES/SM4 CRYPTO DRIVER
> 
> or KEEM BAY?
> 
> Or Keem Bay? Keembay? KeemBay?
It should be Keem Bay.  I googled sandybridge, ivybridge, baytrail,
cherrytrail, medfield and merrifiled and for the *bridge and *trail products
the words are split up and capitalized.  For the *fields they are one-word.

We'll update the KEEMBAY,KeemBay, KEEM BAY instances to Keem Bay to mimic SDB,
IVB, BYT and CHT since those are the majority. I'm not sure I'm going to rename
the file names however but, within the files wherever we talk about Keem Bay we
will use "Keem Bay" consistently.

Sorry for the variances,

--mark
