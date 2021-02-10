Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25BCA315DBE
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 04:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhBJDM2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 22:12:28 -0500
Received: from ozlabs.org ([203.11.71.1]:39057 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229761AbhBJDMZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 22:12:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Db4Y90HD5z9sB4;
        Wed, 10 Feb 2021 14:11:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612926702;
        bh=eAbbv1c4473lc/U2iVCN8pX8dVi4lHGQNHEtlCAMwAk=;
        h=Date:From:To:Cc:Subject:From;
        b=dcpWlTYZSobEHLhKLput+sRfS+UXNTa7KFrR/rGVzA/n8T2qBQJQ/79XmjhZEKb2W
         zCUuQUXv7yWRckVi1GNl0lJd9JgeqsxaPw+qXkJCrP7txXuYWgtx89vEZcied/8RNw
         KXyzIUA1I6GeS7N4DIZHSANgC7vtWSNmMaTOwsMPebrOi304u2s8TTl5DQpga0LSH+
         goTG3GGGLyO0TPubSdqhBJMGH/oUv3TZr86HA63hUfqUsxpMPqas4wZnhi5xjzee+b
         1+y73C4Qz9muXLIi+P030lRrNofbyNTnvJWZ+J3jfYPJWACPVsR9HEOEVhDjh/qi57
         MyiRfuzCHeaHw==
Date:   Wed, 10 Feb 2021 14:11:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20210210141138.11a6ad09@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yMIn+23mpOqpJVxRcPfp7s0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yMIn+23mpOqpJVxRcPfp7s0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/v3d/v3d_sched.c:263:1: error: return type is an incomplete =
type
  263 | v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job=
 *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_gpu_reset_for_timeout':
drivers/gpu/drm/v3d/v3d_sched.c:289:9: error: 'return' with a value, in fun=
ction returning void [-Werror=3Dreturn-type]
  289 |  return DRM_GPU_SCHED_STAT_NOMINAL;
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:263:1: note: declared here
  263 | v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job=
 *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: At top level:
drivers/gpu/drm/v3d/v3d_sched.c:298:1: error: return type is an incomplete =
type
  298 | v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue=
 q,
      | ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_cl_job_timedout':
drivers/gpu/drm/v3d/v3d_sched.c:309:10: error: 'return' with a value, in fu=
nction returning void [-Werror=3Dreturn-type]
  309 |   return DRM_GPU_SCHED_STAT_NOMINAL;
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:298:1: note: declared here
  298 | v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue=
 q,
      | ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: At top level:
drivers/gpu/drm/v3d/v3d_sched.c:316:1: error: return type is an incomplete =
type
  316 | v3d_bin_job_timedout(struct drm_sched_job *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:325:1: error: return type is an incomplete =
type
  325 | v3d_render_job_timedout(struct drm_sched_job *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:334:1: error: return type is an incomplete =
type
  334 | v3d_generic_job_timedout(struct drm_sched_job *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:342:1: error: return type is an incomplete =
type
  342 | v3d_csd_job_timedout(struct drm_sched_job *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_csd_job_timedout':
drivers/gpu/drm/v3d/v3d_sched.c:353:10: error: 'return' with a value, in fu=
nction returning void [-Werror=3Dreturn-type]
  353 |   return DRM_GPU_SCHED_STAT_NOMINAL;
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:342:1: note: declared here
  342 | v3d_csd_job_timedout(struct drm_sched_job *sched_job)
      | ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c: At top level:
drivers/gpu/drm/v3d/v3d_sched.c:362:18: error: initialization of 'enum drm_=
gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type =
'void (*)(struct drm_sched_job *)' [-Werror=3Dincompatible-pointer-types]
  362 |  .timedout_job =3D v3d_bin_job_timedout,
      |                  ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:362:18: note: (near initialization for 'v3d=
_bin_sched_ops.timedout_job')
drivers/gpu/drm/v3d/v3d_sched.c:369:18: error: initialization of 'enum drm_=
gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type =
'void (*)(struct drm_sched_job *)' [-Werror=3Dincompatible-pointer-types]
  369 |  .timedout_job =3D v3d_render_job_timedout,
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:369:18: note: (near initialization for 'v3d=
_render_sched_ops.timedout_job')
drivers/gpu/drm/v3d/v3d_sched.c:376:18: error: initialization of 'enum drm_=
gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type =
'void (*)(struct drm_sched_job *)' [-Werror=3Dincompatible-pointer-types]
  376 |  .timedout_job =3D v3d_generic_job_timedout,
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:376:18: note: (near initialization for 'v3d=
_tfu_sched_ops.timedout_job')
drivers/gpu/drm/v3d/v3d_sched.c:383:18: error: initialization of 'enum drm_=
gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type =
'void (*)(struct drm_sched_job *)' [-Werror=3Dincompatible-pointer-types]
  383 |  .timedout_job =3D v3d_csd_job_timedout,
      |                  ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:383:18: note: (near initialization for 'v3d=
_csd_sched_ops.timedout_job')
drivers/gpu/drm/v3d/v3d_sched.c:390:18: error: initialization of 'enum drm_=
gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type =
'void (*)(struct drm_sched_job *)' [-Werror=3Dincompatible-pointer-types]
  390 |  .timedout_job =3D v3d_generic_job_timedout,
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/v3d/v3d_sched.c:390:18: note: (near initialization for 'v3d=
_cache_clean_sched_ops.timedout_job')

Caused by commit

  c10983e14e8f ("drm/scheduler: Job timeout handler returns status (v3)")

I have used the drm-misc tree from next-20210209 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/yMIn+23mpOqpJVxRcPfp7s0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAjTuoACgkQAVBC80lX
0GzGLAf/d/58uMidoc4JmHnMyZCbt7HY3jpGVAKuh0UnM4qOq+vkKLg/owG+EGe3
4zZycTr+XR091TCvbo7kEsozJzJ/h341hNcl43tQK2oWdVGpylXxZ8ot4ijJvs6k
A/Lgiqc1mU8kRd2ox9ugSOl9iZGE4Dn3s8Uk7BVelsYeXaz5tGPHuKh/4aTgQiK2
o/loR3kqI/acoAvJg6Gccu2mazld4v7qRPflmbRMTs4nvIoKSItkhP09t2SiTRXH
51Xl1SFhUsFJmXiLl+mkNYe2nlkSCW7qGU/YCpn9AUTCGVBcJN4Zb37TjlBWfCk4
JYLjBbGC4rQr0Q1zlVhsLc41lEJZtQ==
=PUsP
-----END PGP SIGNATURE-----

--Sig_/yMIn+23mpOqpJVxRcPfp7s0--
