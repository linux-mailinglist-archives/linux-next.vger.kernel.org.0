Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFD82A7786
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 07:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgKEGp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 01:45:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgKEGpy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2020 01:45:54 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46039C0613CF;
        Wed,  4 Nov 2020 22:45:54 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRYv21QKYz9sRR;
        Thu,  5 Nov 2020 17:45:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604558750;
        bh=D42utSHPZOBaFWPIvY0dd7R1f8pw65gBSZHduqqszYw=;
        h=Date:From:To:Cc:Subject:From;
        b=CGIfZyyG6s55Jl3YmaA7OXq29EORMGvQtJ1ypOaYv03zZ6iAJ0lfCMUZw8DeYFoBN
         DBNOPBDWA2OBNBKxG2gEZocLNFrLYx5CrBZH2K5OAlePzJE9/CsPwz4gjvFm/SZPDU
         VxgA+AXknBUXQcpGaagxwmG2G9fK8l+dKenYI5IaWI4gZL7GK6XGyP7g8g6OOH89wv
         yQPNkOSNO9MEbjosflRJctXyOHStN1O0MjhHgJN0TTvPuwcsQ+Ck54mAUWSJEToIE1
         bE6CNcYDMok+ulmkivqy0c+QLBiIL5SJ8bS3FOrZKG5D9Jkm0jBxEUHFT844cOH2ph
         pcioxzSSuTXQg==
Date:   Thu, 5 Nov 2020 17:45:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Anand K Mistry <amistry@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20201105174549.614c2de4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PM_8==MSCe8epjVM=LmLXQr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PM_8==MSCe8epjVM=LmLXQr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/proc.rst:296: WARNING: Malformed table.
Text in column margin in table line 61.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Field                       Content
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Name                        filename of the executable
Umask                       file mode creation mask
State                       state (R is running, S is sleeping, D is sleepi=
ng
                            in an uninterruptible wait, Z is zombie,
                            T is traced or stopped)
Tgid                        thread group ID
Ngid                        NUMA group ID (0 if none)
Pid                         process id
PPid                        process id of the parent process
TracerPid                   PID of process tracing this process (0 if not)
Uid                         Real, effective, saved set, and  file system UI=
Ds
Gid                         Real, effective, saved set, and  file system GI=
Ds
FDSize                      number of file descriptor slots currently alloc=
ated
Groups                      supplementary group list
NStgid                      descendant namespace thread group ID hierarchy
NSpid                       descendant namespace process ID hierarchy
NSpgid                      descendant namespace process group ID hierarchy
NSsid                       descendant namespace session ID hierarchy
VmPeak                      peak virtual memory size
VmSize                      total program size
VmLck                       locked memory size
VmPin                       pinned memory size
VmHWM                       peak resident set size ("high water mark")
VmRSS                       size of memory portions. It contains the three
                            following parts
                            (VmRSS =3D RssAnon + RssFile + RssShmem)
RssAnon                     size of resident anonymous memory
RssFile                     size of resident file mappings
RssShmem                    size of resident shmem memory (includes SysV sh=
m,
                            mapping of tmpfs and shared anonymous mappings)
VmData                      size of private data segments
VmStk                       size of stack segments
VmExe                       size of text segment
VmLib                       size of shared library code
VmPTE                       size of page table entries
VmSwap                      amount of swap used by anonymous private data
                            (shmem swap usage is not included)
HugetlbPages                size of hugetlb memory portions
CoreDumping                 process's memory is currently being dumped
                            (killing the process may lead to a corrupted co=
re)
THP_enabled                 process is allowed to use THP (returns 0 when
                            PR_SET_THP_DISABLE is set on the process
Threads                     number of threads
SigQ                        number of signals queued/max. number for queue
SigPnd                      bitmap of pending signals for the thread
ShdPnd                      bitmap of shared pending signals for the process
SigBlk                      bitmap of blocked signals
SigIgn                      bitmap of ignored signals
SigCgt                      bitmap of caught signals
CapInh                      bitmap of inheritable capabilities
CapPrm                      bitmap of permitted capabilities
CapEff                      bitmap of effective capabilities
CapBnd                      bitmap of capabilities bounding set
CapAmb                      bitmap of ambient capabilities
NoNewPrivs                  no_new_privs, like prctl(PR_GET_NO_NEW_PRIV, ..=
.)
Seccomp                     seccomp mode, like prctl(PR_GET_SECCOMP, ...)
Speculation_Store_Bypass    speculative store bypass mitigation status
Speculation_Indirect_Branch indirect branch speculation mode
Cpus_allowed                mask of CPUs on which this process may run
Cpus_allowed_list           Same as previous, but in "list format"
Mems_allowed                mask of memory nodes allowed to this process
Mems_allowed_list           Same as previous, but in "list format"
voluntary_ctxt_switches     number of voluntary context switches
nonvoluntary_ctxt_switches  number of non voluntary context switches
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Documentation/filesystems/proc.rst:234: WARNING: Error parsing content bloc=
k for the "table" directive: exactly one table expected.

.. table:: Table 1-2: Contents of the status files (as of 4.19)

 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
 Field                       Content
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
 Name                        filename of the executable
 Umask                       file mode creation mask
 State                       state (R is running, S is sleeping, D is sleep=
ing
                             in an uninterruptible wait, Z is zombie,
                             T is traced or stopped)
 Tgid                        thread group ID
 Ngid                        NUMA group ID (0 if none)
 Pid                         process id
 PPid                        process id of the parent process
 TracerPid                   PID of process tracing this process (0 if not)
 Uid                         Real, effective, saved set, and  file system U=
IDs
 Gid                         Real, effective, saved set, and  file system G=
IDs
 FDSize                      number of file descriptor slots currently allo=
cated
 Groups                      supplementary group list
 NStgid                      descendant namespace thread group ID hierarchy
 NSpid                       descendant namespace process ID hierarchy
 NSpgid                      descendant namespace process group ID hierarchy
 NSsid                       descendant namespace session ID hierarchy
 VmPeak                      peak virtual memory size
 VmSize                      total program size
 VmLck                       locked memory size
 VmPin                       pinned memory size
 VmHWM                       peak resident set size ("high water mark")
 VmRSS                       size of memory portions. It contains the three
                             following parts
                             (VmRSS =3D RssAnon + RssFile + RssShmem)
 RssAnon                     size of resident anonymous memory
 RssFile                     size of resident file mappings
 RssShmem                    size of resident shmem memory (includes SysV s=
hm,
                             mapping of tmpfs and shared anonymous mappings)
 VmData                      size of private data segments
 VmStk                       size of stack segments
 VmExe                       size of text segment
 VmLib                       size of shared library code
 VmPTE                       size of page table entries
 VmSwap                      amount of swap used by anonymous private data
                             (shmem swap usage is not included)
 HugetlbPages                size of hugetlb memory portions
 CoreDumping                 process's memory is currently being dumped
                             (killing the process may lead to a corrupted c=
ore)
 THP_enabled                 process is allowed to use THP (returns 0 when
                             PR_SET_THP_DISABLE is set on the process
 Threads                     number of threads
 SigQ                        number of signals queued/max. number for queue
 SigPnd                      bitmap of pending signals for the thread
 ShdPnd                      bitmap of shared pending signals for the proce=
ss
 SigBlk                      bitmap of blocked signals
 SigIgn                      bitmap of ignored signals
 SigCgt                      bitmap of caught signals
 CapInh                      bitmap of inheritable capabilities
 CapPrm                      bitmap of permitted capabilities
 CapEff                      bitmap of effective capabilities
 CapBnd                      bitmap of capabilities bounding set
 CapAmb                      bitmap of ambient capabilities
 NoNewPrivs                  no_new_privs, like prctl(PR_GET_NO_NEW_PRIV, .=
..)
 Seccomp                     seccomp mode, like prctl(PR_GET_SECCOMP, ...)
 Speculation_Store_Bypass    speculative store bypass mitigation status
 Speculation_Indirect_Branch indirect branch speculation mode
 Cpus_allowed                mask of CPUs on which this process may run
 Cpus_allowed_list           Same as previous, but in "list format"
 Mems_allowed                mask of memory nodes allowed to this process
 Mems_allowed_list           Same as previous, but in "list format"
 voluntary_ctxt_switches     number of voluntary context switches
 nonvoluntary_ctxt_switches  number of non voluntary context switches
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Introduced by commit

  60b492d745d5 ("proc: provide details on indirect branch speculation")

--=20
Cheers,
Stephen Rothwell

--Sig_/PM_8==MSCe8epjVM=LmLXQr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jn50ACgkQAVBC80lX
0Gz64AgAmOMznGJXjrKcmmZb3Nk2UU+0IyxKHDT0Uv6J9PXpTz6ZTttdOYyrJH9R
qg3xDNZ/i88+chAStYAOGhDMEhf4RGVq0osjJw4cM9iY2jhiBynOnOppwKWvoNCk
4dBmkRi1CMIeXTVonIVOM0iMeo9X/whAYxPIrTCFAJrIGhzQrOY2/RGqxpVMJ7Py
nJ4OLiiZTk9BK3L07/us/J+Pi99rXrJOcrbEBaJY9uTiXbdIFWf8p9Bnel/LIyWs
EIA0U1nlHfhO5otKYZUWYvCE099o7ShgC7+fXZKLdqxAZ6ccS8cdY2Uy0n6G5KUF
vQEDxnqGHVmZzT8/slF6aVCtu7cJBw==
=85f7
-----END PGP SIGNATURE-----

--Sig_/PM_8==MSCe8epjVM=LmLXQr--
