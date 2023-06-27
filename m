Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E54173F0A7
	for <lists+linux-next@lfdr.de>; Tue, 27 Jun 2023 03:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjF0Byl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Jun 2023 21:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjF0Byj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Jun 2023 21:54:39 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372AE1720;
        Mon, 26 Jun 2023 18:54:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qqnp209DBz4wb6;
        Tue, 27 Jun 2023 11:54:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1687830875;
        bh=RRajNkNOmZ7k6F/p7wmvGLYlz9dAU7dhw4zq91Sf2i8=;
        h=Date:From:To:Cc:Subject:From;
        b=kGYYiwiL1YXQkNnZ5HOR9k/2YfORMdjyglVwTjbwG5iIGUg0pLhIC2Z5+Tqh11lpo
         PAGrMvXAZj6xrsJnoot7tTkHJLArlZZBMGNII/4WP9V/k9nObblgVC5d4ZJJDB+wVf
         rJemaPmOES9zyZeCBjbGb2FzoqF5IojIshloWsozYTwouPM7Rjg/llRIAiFzQleh1Q
         /xUQ2OYiFD1S10LjbIJ+kpqc4+6oUKSXmz2I/e9+gNIDosh7xjN29Wj4wYrVkioi9B
         8g4DKeFNKqR5zs0q8uE/msFCMrBO7YJo8KZzz1Fw199r6Jpp1PCpcJ2idwh/ZD5UkG
         wOaD/OmuJNOng==
Date:   Tue, 27 Jun 2023 11:54:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@redhat.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <20230627115432.6179f0ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A0wej4cPb9Y4mYG4zvi4GKW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A0wej4cPb9Y4mYG4zvi4GKW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  include/drm/gpu_scheduler.h

between commit:

  db8b4968a8d0 ("drm/sched: Call drm_sched_fence_set_parent() from drm_sche=
d_fence_scheduled()")

from the drm-misc-fixes tree and commit:

  539f9ee4b52a ("drm/scheduler: properly forward fence errors")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/drm/gpu_scheduler.h
index b29e347b10a9,e95b4837e5a3..000000000000
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@@ -581,16 -581,18 +581,17 @@@ void drm_sched_entity_push_job(struct d
  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
  				   enum drm_sched_priority priority);
  bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
+ int drm_sched_entity_error(struct drm_sched_entity *entity);
 =20
 -void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
 -				struct dma_fence *fence);
  struct drm_sched_fence *drm_sched_fence_alloc(
  	struct drm_sched_entity *s_entity, void *owner);
  void drm_sched_fence_init(struct drm_sched_fence *fence,
  			  struct drm_sched_entity *entity);
  void drm_sched_fence_free(struct drm_sched_fence *fence);
 =20
 -void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
 +void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
 +			       struct dma_fence *parent);
- void drm_sched_fence_finished(struct drm_sched_fence *fence);
+ void drm_sched_fence_finished(struct drm_sched_fence *fence, int result);
 =20
  unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
  void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,

--Sig_/A0wej4cPb9Y4mYG4zvi4GKW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSaQVgACgkQAVBC80lX
0GxhOQgAkVrLri2QnnyvU6f9lijKRB7p/0cLsfeP1cDKHbT43E4C6gDIydnHifeh
Nlz/fxPU0HZfQufeLcP+8TVakK6o478QX5hyChWUQtNGyANdziaE9Kss7An5apd5
YhW44XlEqhZuj8keVmGIX2v8B/4BNk/23llsIUQT7qGGr8nE4fmHBnWeiDfst6f4
KJR/FQPeCY57TW1cdZlj4EFNjkVjY4RYgOd3La4TjpmCA3ybDp6ZKZXyGAAdfpfE
LPic3ty1GH6y3syIikHuu6OFGWs7MR5a3FApw0TdqrAsFd9GGWBWpuHbx+RgV6o/
JmI0uiryCD6c/5aI9QF6V/4Nv4vFUg==
=FoQ1
-----END PGP SIGNATURE-----

--Sig_/A0wej4cPb9Y4mYG4zvi4GKW--
