Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA413F8375
	for <lists+linux-next@lfdr.de>; Thu, 26 Aug 2021 10:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240207AbhHZIBc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 04:01:32 -0400
Received: from ozlabs.org ([203.11.71.1]:43937 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233064AbhHZIBb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Aug 2021 04:01:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwFdl2Gxnz9sWw;
        Thu, 26 Aug 2021 18:00:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629964843;
        bh=Q0GGhUNokQ2s+2z+0/pzvcAEMaGDmE1+hs/oX2nlsCs=;
        h=Date:From:To:Cc:Subject:From;
        b=cExW1HbTMfOJIQ8tmo1G0/Mcev8mF9E+dTnJC7YCvGN56KNNW5Co7Tt5G75AZUrjE
         NpZJ6mksSf1kFGrOcF5Jcr1SnxnJ0o7Gno3loDo10yBgjMa+H3tem9SldgovWNQ1fh
         JopRffLQvR+VwEzlTDIjVwA8ZXf4x10YQWNYnUq8v4KI4dQbKwFbGyTEx037Zfc//f
         LoUuD2idNenigrQnGjKdSDTMSVVPxXdpvrM8/m2Qy0j7OsSmBOUk+qOId4Rk1Nq0Rs
         j9UdUIuVUDnMfb0j34saPgodQsKI1vfH+ysWwBwQXwUXwbD7kO2BrFh71mggImUOQD
         j589BJI35cf9w==
Date:   Thu, 26 Aug 2021 18:00:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the kspp tree
Message-ID: <20210826180042.35e8aab6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_ZaKhLJIG4ljgy_w2X31tvF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_ZaKhLJIG4ljgy_w2X31tvF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'of_css':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_file_write':
kernel/cgroup/cgroup.c:476:44: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:389:48: note: in expansion of macro 'READ_ONCE'
  389 |  typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
      |                                                ^~~~~~~~~
include/linux/rcupdate.h:528:2: note: in expansion of macro '__rcu_derefere=
nce_check'
  528 |  __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
      |  ^~~~~~~~~~~~~~~~~~~~~~~
kernel/cgroup/cgroup.c:476:10: note: in expansion of macro 'rcu_dereference=
_check'
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
      |          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_get_e_css':
kernel/cgroup/cgroup.c:476:44: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:389:48: note: in expansion of macro 'READ_ONCE'
  389 |  typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
      |                                                ^~~~~~~~~
include/linux/rcupdate.h:528:2: note: in expansion of macro '__rcu_derefere=
nce_check'
  528 |  __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
      |  ^~~~~~~~~~~~~~~~~~~~~~~
kernel/cgroup/cgroup.c:476:10: note: in expansion of macro 'rcu_dereference=
_check'
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
      |          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
kernel/cgroup/cgroup.c:590:27: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  590 |  css =3D init_css_set.subsys[ss->id];
      |        ~~~~~~~~~~~~~~~~~~~^~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:205:30: note: while referencing 'subsys'
  205 |  struct cgroup_subsys_state *subsys[CGROUP_SUBSYS_COUNT];
      |                              ^~~~~~
kernel/cgroup/cgroup.c:744:16: note: defined here 'init_css_set'
  744 | struct css_set init_css_set =3D {
      |                ^~~~~~~~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_subtree_control_show':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_controllers_show':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cpu_stat_show':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_freeze_show':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_max_depth_show':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_max_descendants_show':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_stat_show':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_events_show':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_type_show':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_seqfile_show':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_addrm_files':
kernel/cgroup/cgroup.c:476:44: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:389:48: note: in expansion of macro 'READ_ONCE'
  389 |  typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
      |                                                ^~~~~~~~~
include/linux/rcupdate.h:528:2: note: in expansion of macro '__rcu_derefere=
nce_check'
  528 |  __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
      |  ^~~~~~~~~~~~~~~~~~~~~~~
kernel/cgroup/cgroup.c:476:10: note: in expansion of macro 'rcu_dereference=
_check'
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
      |          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_e_css':
kernel/cgroup/cgroup.c:476:44: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:389:48: note: in expansion of macro 'READ_ONCE'
  389 |  typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
      |                                                ^~~~~~~~~
include/linux/rcupdate.h:528:2: note: in expansion of macro '__rcu_derefere=
nce_check'
  528 |  __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
      |  ^~~~~~~~~~~~~~~~~~~~~~~
kernel/cgroup/cgroup.c:476:10: note: in expansion of macro 'rcu_dereference=
_check'
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
      |          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
kernel/cgroup/cgroup.c:561:28: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  561 |  return init_css_set.subsys[ss->id];
      |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:205:30: note: while referencing 'subsys'
  205 |  struct cgroup_subsys_state *subsys[CGROUP_SUBSYS_COUNT];
      |                              ^~~~~~
kernel/cgroup/cgroup.c:744:16: note: defined here 'init_css_set'
  744 | struct css_set init_css_set =3D {
      |                ^~~~~~~~~~~~
kernel/cgroup/cgroup.c: In function 'cgroup_taskset_next':
kernel/cgroup/cgroup.c:2395:29: warning: array subscript '<unknown>' is out=
side the bounds of an interior zero-length array 'struct cgroup_subsys_stat=
e *[0]' [-Wzero-length-bounds]
 2395 |     *dst_cssp =3D cset->subsys[tset->ssid];
      |                 ~~~~~~~~~~~~^~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:205:30: note: while referencing 'subsys'
  205 |  struct cgroup_subsys_state *subsys[CGROUP_SUBSYS_COUNT];
      |                              ^~~~~~
kernel/cgroup/cgroup.c:2393:42: warning: array subscript '<unknown>' is out=
side the bounds of an interior zero-length array 'struct cgroup_subsys_stat=
e *[0]' [-Wzero-length-bounds]
 2393 |     *dst_cssp =3D cset->mg_dst_cset->subsys[tset->ssid];
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:205:30: note: while referencing 'subsys'
  205 |  struct cgroup_subsys_state *subsys[CGROUP_SUBSYS_COUNT];
      |                              ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_rm_cftypes':
kernel/cgroup/cgroup.c:476:44: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:389:48: note: in expansion of macro 'READ_ONCE'
  389 |  typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
      |                                                ^~~~~~~~~
include/linux/rcupdate.h:528:2: note: in expansion of macro '__rcu_derefere=
nce_check'
  528 |  __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
      |  ^~~~~~~~~~~~~~~~~~~~~~~
kernel/cgroup/cgroup.c:476:10: note: in expansion of macro 'rcu_dereference=
_check'
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
      |          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c:476:44: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:389:48: note: in expansion of macro 'READ_ONCE'
  389 |  typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
      |                                                ^~~~~~~~~
include/linux/rcupdate.h:528:2: note: in expansion of macro '__rcu_derefere=
nce_check'
  528 |  __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
      |  ^~~~~~~~~~~~~~~~~~~~~~~
kernel/cgroup/cgroup.c:476:10: note: in expansion of macro 'rcu_dereference=
_check'
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
      |          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
kernel/cgroup/cgroup.c: In function 'css_task_iter_start':
kernel/cgroup/cgroup.c:4647:18: warning: array subscript '<unknown>' is out=
side the bounds of an interior zero-length array 'struct list_head[0]' [-Wz=
ero-length-bounds]
 4647 |   it->cset_pos =3D &css->cgroup->e_csets[css->ss->id];
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:443:19: note: while referencing 'e_csets'
  443 |  struct list_head e_csets[CGROUP_SUBSYS_COUNT];
      |                   ^~~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function '__cgroup_procs_start':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_procs_start':
kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:403:25: note: in expansion of macro 'READ_ONCE'
  403 |  typeof(p) ________p1 =3D READ_ONCE(p); \
      |                         ^~~~~~~~~
kernel/cgroup/cgroup.c:651:10: note: in expansion of macro 'rcu_dereference=
_raw'
  651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
      |          ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~
In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:264,
                 from include/uapi/linux/swab.h:6,
                 from include/linux/swab.h:5,
                 from arch/arm/include/asm/opcodes.h:86,
                 from arch/arm/include/asm/bug.h:7,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:13,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'css_tryget_online_from_dir':
kernel/cgroup/cgroup.c:476:44: warning: array subscript '<unknown>' is outs=
ide the bounds of an interior zero-length array 'struct cgroup_subsys_state=
 *[0]' [-Wzero-length-bounds]
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ON=
CE'
   44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) =
*)&(x))
      |                                                                    =
    ^
include/linux/rcupdate.h:389:48: note: in expansion of macro 'READ_ONCE'
  389 |  typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
      |                                                ^~~~~~~~~
include/linux/rcupdate.h:528:2: note: in expansion of macro '__rcu_derefere=
nce_check'
  528 |  __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
      |  ^~~~~~~~~~~~~~~~~~~~~~~
kernel/cgroup/cgroup.c:476:10: note: in expansion of macro 'rcu_dereference=
_check'
  476 |   return rcu_dereference_check(cgrp->subsys[ss->id],
      |          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:426:36: note: while referencing 'subsys'
  426 |  struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
      |                                    ^~~~~~

Introduced by commit

  7d8aac16a0a8 ("Makefile: Enable -Wzero-length-bounds")

--=20
Cheers,
Stephen Rothwell

--Sig_/_ZaKhLJIG4ljgy_w2X31tvF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEnSioACgkQAVBC80lX
0Gw6Ngf/ZWS0vgKQ/Vh79qwTazCxec0/chcr3xCVGq1XOhD0LfOadRX5fq5Eyg+W
n6Ud8EBMhlrIJuNVIuh0AMH2x0t9MsGMVjh0hWDKAzY7TOB7r/uEYCc/6LjPubBJ
2Qt+XBhYiDg/H+KuQ6PgVrx8aTb0VGNY6TeyUosjZhlUAtZjJ58DpQvHLZfWSjiT
lDW+uhB/7ZJ0JjNfmCgPj9/ftYU7nqNFmuccxCoQEIo+yKUrPLq8YvJ3lHgQ/YSQ
/+A63xnira/d0mCXl0c0ed9peQY+VA+mqIqWplUCKWt6rjNkfyDpxMJlRws3FAh5
qwprLdgM0TCgAonTkB9/zX+nmRFeiQ==
=EHfh
-----END PGP SIGNATURE-----

--Sig_/_ZaKhLJIG4ljgy_w2X31tvF--
