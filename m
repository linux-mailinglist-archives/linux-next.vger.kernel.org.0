Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432AD445FA6
	for <lists+linux-next@lfdr.de>; Fri,  5 Nov 2021 07:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhKEGSD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Nov 2021 02:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhKEGSD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Nov 2021 02:18:03 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FA7C061714;
        Thu,  4 Nov 2021 23:15:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HlqxL30X6z4xdL;
        Fri,  5 Nov 2021 17:15:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636092921;
        bh=ABu42RiFT1taPHynORs6qxyIrsgHaPYvXtuZnDvLm28=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Phd/GLBGSIR5NA6U4OcbR4wyh40bYgco8LL429cImCmDIf0vz8USNvPLk2qJ5FD6p
         pvfgD1rACbzSWc9IssJ45dmK8dw0d2rBhX2clDU05+79FbN3X2PhUFSmaYe7R/Us5j
         RBLCybZssKNtLiIu9PBS57vjQ1Xpt6WBmjvH4SoYkdcePqfzTZxDeqy/ge+GP6qnxh
         MVcz8w4Pmml1mJ033rzesx9tfUYtJLCKmgvSyqnr0iOTpwSN3uK3bSD6LNKQqPjN5z
         BfTOpRZwlQiPkzbnyKGK1ahxgxqv8KX4gQqUNLIUcB1kQ5CnuQDvGAkogZE41Xjz7W
         Iv4D7yeBZwmXw==
Date:   Fri, 5 Nov 2021 17:15:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20211105171517.287de894@canb.auug.org.au>
In-Reply-To: <20211101194223.749197c5@canb.auug.org.au>
References: <20211015202648.258445ef@canb.auug.org.au>
        <20211101194223.749197c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f1z=jp8ned0U5MhcxSkEu39";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/f1z=jp8ned0U5MhcxSkEu39
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 1 Nov 2021 19:42:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Fri, 15 Oct 2021 20:26:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the drm-misc tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > drivers/gpu/drm/drm_modeset_lock.c:111:29: error: conflicting types for=
 '__stack_depot_save'
> >   111 | static depot_stack_handle_t __stack_depot_save(void)
> >       |                             ^~~~~~~~~~~~~~~~~~
> > In file included from include/linux/page_ext.h:7,
> >                  from include/linux/mm.h:25,
> >                  from include/linux/kallsyms.h:13,
> >                  from include/linux/bpf.h:20,
> >                  from include/linux/bpf-cgroup.h:5,
> >                  from include/linux/cgroup-defs.h:22,
> >                  from include/linux/cgroup.h:28,
> >                  from include/linux/memcontrol.h:13,
> >                  from include/linux/swap.h:9,
> >                  from include/linux/suspend.h:5,
> >                  from include/linux/regulator/consumer.h:35,
> >                  from include/linux/i2c.h:18,
> >                  from include/drm/drm_crtc.h:28,
> >                  from include/drm/drm_atomic.h:31,
> >                  from drivers/gpu/drm/drm_modeset_lock.c:24:
> > include/linux/stackdepot.h:18:22: note: previous declaration of '__stac=
k_depot_save' was here
> >    18 | depot_stack_handle_t __stack_depot_save(unsigned long *entries,
> >       |                      ^~~~~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks=
 without backoff")
> >=20
> > This may only have been revealed because of another fix I have had to
> > apply today.
> >=20
> > I have applied the following patch for today.
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 15 Oct 2021 20:17:52 +1100
> > Subject: [PATCH] drm/locking: fix for name conflict
> >=20
> > Fixes: cd06ab2fd48f ("drm/locking: add backtrace for locking contended =
locks without backoff")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/drm/drm_modeset_lock.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_m=
odeset_lock.c
> > index 4d32b61fa1fd..ee36dd20900d 100644
> > --- a/drivers/gpu/drm/drm_modeset_lock.c
> > +++ b/drivers/gpu/drm/drm_modeset_lock.c
> > @@ -79,7 +79,7 @@
> >  static DEFINE_WW_CLASS(crtc_ww_class);
> > =20
> >  #if IS_ENABLED(CONFIG_DRM_DEBUG_MODESET_LOCK)
> > -static noinline depot_stack_handle_t __stack_depot_save(void)
> > +static noinline depot_stack_handle_t __drm_stack_depot_save(void)
> >  {
> >  	unsigned long entries[8];
> >  	unsigned int n;
> > @@ -108,7 +108,7 @@ static void __stack_depot_print(depot_stack_handle_=
t stack_depot)
> >  	kfree(buf);
> >  }
> >  #else /* CONFIG_DRM_DEBUG_MODESET_LOCK */
> > -static depot_stack_handle_t __stack_depot_save(void)
> > +static depot_stack_handle_t __drm_stack_depot_save(void)
> >  {
> >  	return 0;
> >  }
> > @@ -317,7 +317,7 @@ static inline int modeset_lock(struct drm_modeset_l=
ock *lock,
> >  		ret =3D 0;
> >  	} else if (ret =3D=3D -EDEADLK) {
> >  		ctx->contended =3D lock;
> > -		ctx->stack_depot =3D __stack_depot_save();
> > +		ctx->stack_depot =3D __drm_stack_depot_save();
> >  	}
> > =20
> >  	return ret;
>=20
> This has reappeared today.  I don't know what happened to the drm-misc
> tree over the weeked :-(
>=20
> I have reapplied the above fix.

So the above drm-misc commit is now in the drm tree, but its fix up
commit vanished from the drm-misc tree over the past weekend :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/f1z=jp8ned0U5MhcxSkEu39
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGEy/UACgkQAVBC80lX
0GwLYgf/YsXemq1FgUmgNNpY1yHPV39pjn7pDRTmtxoFSEa4Fo61slx+DkE9qeRm
PSH5cAobM2bk8Ir8cG2iuqR2J0A2j1lzwh/FTX0YShmB5sPxYz9NQ1S+Oe8lTUc7
uhuRJPj/4CDimckFkiYjF5Nwlim0E7sOSapBuFW7RBzcMhRWlXn7foF6xc385mUi
pQvxiE6TIHzq8NgaFwNyvs9ouVz1dchou+phRXX187ENX958+YHYl9QZLJJ8MMjJ
kHk+pMN3md6pGWLsu34t1/+9aAqG1aVKChPgRVRotwmKZMj/lJAIrmxE6Is6gdpY
eVQOAtHXzcLJkDujD2OSOo+RIyHEqQ==
=q40p
-----END PGP SIGNATURE-----

--Sig_/f1z=jp8ned0U5MhcxSkEu39--
