Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6233D42469D
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 21:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239239AbhJFTVr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 15:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhJFTVq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 15:21:46 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F201C061746;
        Wed,  6 Oct 2021 12:19:54 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id oa4so2268883pjb.2;
        Wed, 06 Oct 2021 12:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0jAsMEfBv+DcxMXsPiiJt1kTB1Jf6e6c8VRPvUOa/Y=;
        b=m002cgKPonyPCtwTtd61Z2RLuCCj+ZxKTNKgCm1ZpqMESr3CgKxeYjTk5/2cPXVVbt
         CWjHkq3HJ9PrtbdK9/TgSB3WadIM03qoaFDwVpisBfiUs//RRSidBFVBnmza5iNsHmOy
         P+JdiIB1N3+MXYHnQ4a0BcOIRdfL+1JyrLs5FFQegUQZY1Rns7THss5zkB8nq0Yn0Kwt
         DgtJJi2CmNd14W1bjB85x4YISVuJGbglPEls1g2JX/d1rbZ2/nbs+XmyerEEZO2Wnhx0
         j0kZoPxXawbUBXI5jQRtP/KBISJmkFuua1kU/fGPAXVYlBq9yFV83G90TZbopyvnvZX+
         7wBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0jAsMEfBv+DcxMXsPiiJt1kTB1Jf6e6c8VRPvUOa/Y=;
        b=lHBnPTOrDFdo9QSWhX/hlu5XTwGMmXdCPn48TSTCCe/NLohBnQPoKPNmNfdhQnR+FJ
         jkhbzbMhIpO324zH3IL3qliassHC0d77Ccjz5EKfXex1BpIuQJzDY30oJMJn3dfnDuqk
         7xMhl8Xp7f+XWMQSrMx+a+mEY+krRh+4x+yhRpgG+9oIC5MnZnfrXMxq0MjuKdTpY5Qx
         +K0pe4zI4WDIj7Es9zORi2c4HSsjHNwDxxl3IKHinH4EsXsuSiaEquvymKXk8/eXB2eC
         vkwKaFupc37Z2b6zr1EMOScHvIewVB7whhzE+9m15XMglAthzChqX/Di9vdNVHUWt1Vg
         BKpQ==
X-Gm-Message-State: AOAM533UcJf+8YY521IAhWx6TZ7AK752IhlUeulrYAWx/un5obWw7B2/
        /+WdW+Qdh1KLoqcApaNqWrOsb4+NE3vK1WgI
X-Google-Smtp-Source: ABdhPJzQwANSt786vSCRJPXh1tik6nhGWoSbOZVW5dL4jwGsKGZW/oEJ+m3A8h17S9TB4mqmTjNBIw==
X-Received: by 2002:a17:90b:513:: with SMTP id r19mr504723pjz.243.1633547993331;
        Wed, 06 Oct 2021 12:19:53 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id u1sm5795352pju.2.2021.10.06.12.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:19:52 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-next@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-btrfs@vger.kernel.org, squashfs-devel@lists.sourceforge.net,
        linux-f2fs-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Nick Terrell <terrelln@fb.com>, Chris Mason <clm@fb.com>,
        Petr Malat <oss@malat.biz>, Yann Collet <cyan@fb.com>,
        Christoph Hellwig <hch@infradead.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        David Sterba <dsterba@suse.cz>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Felix Handte <felixh@fb.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Paul Jones <paul@pauljones.id.au>,
        Tom Seewald <tseewald@gmail.com>
Subject: [GIT PULL] zstd changes for linux-next
Date:   Wed,  6 Oct 2021 12:17:24 -0700
Message-Id: <20211006191724.3187129-1-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

The following changes since commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896:

  Linux 5.15-rc4 (2021-10-03 14:08:47 -0700)

are available in the Git repository at:

  https://github.com/terrelln/linux.git zstd-1.4.10

for you to fetch changes up to a0ccd980d5048053578f3b524e3cd3f5d980a9c5:

  MAINTAINERS: Add maintainer entry for zstd (2021-10-04 20:04:32 -0700)

I would like to merge this pull request into linux-next to bake, and then submit
the PR to Linux in the 5.16 merge window. If you have been a part of the
discussion, are a maintainer of a caller of zstd, tested this code, or otherwise
been involved, thank you! And could you please respond below with an appropiate
tag, so I can collect support for the PR

Best,
Nick Terrell

----------------------------------------------------------------
Update to zstd-1.4.10

- The first commit adds a new kernel-style wrapper around zstd. This wrapper API
  is functionally equivalent to the subset of the current zstd API that is
  currently used. The wrapper API changes to be kernel style so that the symbols
  don't collide with zstd's symbols. The update to zstd-1.4.10 maintains the same
  API and preserves the semantics, so that none of the callers need to be
  updated. All callers are updated in the commit, because there are zero
  functional changes.
- The second commit adds an indirection for `lib/decompress_unzstd.c` so it
  doesn't depend on the layout of `lib/zstd/` to include every source file.
  This allows the next patch to be automatically generated.
- The third commit is automatically generated, and imports the zstd-1.4.10 source
  code. This commit is completely generated by automation.
- The fourth commit adds me (terrelln@fb.com) as the maintainer of `lib/zstd`.

The discussion around this patchset has been pretty long, so I've included a
FAQ-style summary of the history of the patchset, and why we are taking this
approach.

Why do we need to update?
-------------------------

The zstd version in the kernel is based off of zstd-1.3.1, which is was released
August 20, 2017. Since then zstd has seen many bug fixes and performance
improvements. And, importantly, upstream zstd is continuously fuzzed by OSS-Fuzz,
and bug fixes aren't backported to older versions. So the only way to sanely get
these fixes is to keep up to date with upstream zstd. There are no known security
issues that affect the kernel, but we need to be able to update in case there
are. And while there are no known security issues, there are relevant bug fixes.
For example the problem with large kernel decompression has been fixed upstream
for over 2 years https://lkml.org/lkml/2020/9/29/27.

Additionally the performance improvements for kernel use cases are significant.
Measured for x86_64 on my Intel i9-9900k @ 3.6 GHz:

- BtrFS zstd compression at levels 1 and 3 is 5% faster
- BtrFS zstd decompression+read is 15% faster
- SquashFS zstd decompression+read is 15% faster
- F2FS zstd compression+write at level 3 is 8% faster
- F2FS zstd decompression+read is 20% faster
- ZRAM decompression+read is 30% faster
- Kernel zstd decompression is 35% faster
- Initramfs zstd decompression+build is 5% faster

On top of this, there are significant performance improvements coming down the
line in the next zstd release, and the new automated update patch generation
will allow us to pull them easily.

How is the update patch generated?
----------------------------------

The first two patches are preparation for updating the zstd version. Then the
3rd patch in the series imports upstream zstd into the kernel. This patch is
automatically generated from upstream. A script makes the necessary changes and
imports it into the kernel. The changes are:

- Replace all libc dependencies with kernel replacements and rewrite includes.
- Remove unncessary portability macros like: #if defined(_MSC_VER).
- Use the kernel xxhash instead of bundling it.

This automation gets tested every commit by upstream's continuous integration.
When we cut a new zstd release, we will submit a patch to the kernel to update
the zstd version in the kernel.

The automated process makes it easy to keep the kernel version of zstd up to
date. The current zstd in the kernel shares the guts of the code, but has a lot
of API and minor changes to work in the kernel. This is because at the time
upstream zstd was not ready to be used in the kernel envrionment as-is. But,
since then upstream zstd has evolved to support being used in the kernel as-is.

Why are we updating in one big patch?
-------------------------------------

The 3rd patch in the series is very large. This is because it is restructuring
the code, so it both deletes the existing zstd, and re-adds the new structure.
Future updates will be directly proportional to the changes in upstream zstd
since the last import. They will admittidly be large, as zstd is an actively
developed project, and has hundreds of commits between every release. However,
there is no other great alternative.

One option ruled out is to replay every upstream zstd commit. This is not feasible
for several reasons:
- There are over 3500 upstream commits since the zstd version in the kernel.
- The automation to automatically generate the kernel update was only added recently,
  so older commits cannot easily be imported.
- Not every upstream zstd commit builds.
- Only zstd releases are "supported", and individual commits may have bugs that were
  fixed before a release.

Another option to reduce the patch size would be to first reorganize to the new
file structure, and then apply the patch. However, the current kernel zstd is formatted
with clang-format to be more "kernel-like". But, the new method imports zstd as-is,
without additional formatting, to allow for closer correlation with upstream, and
easier debugging. So the patch wouldn't be any smaller.

It also doesn't make sense to import upstream zstd commit by commit going
forward. Upstream zstd doesn't support production use cases running of the
development branch. We have a lot of post-commit fuzzing that catches many bugs,
so indiviudal commits may be buggy, but fixed before a release. So going forward,
I intend to import every (important) zstd release into the Kernel.

So, while it isn't ideal, updating in one big patch is the only patch I see forward.

Who is responsible for this code?
---------------------------------

I am. This patchset adds me as the maintainer for zstd. Previously, there was no tree
for zstd patches. Because of that, there were several patches that either got ignored,
or took a long time to merge, since it wasn't clear which tree should pick them up.
I'm officially stepping up as maintainer, and setting up my tree as the path through
which zstd patches get merged. I'll make sure that patches to the kernel zstd get
ported upstream, so they aren't erased when the next version update happens.

How is this code tested?
------------------------

I tested every caller of zstd on x86_64 (BtrFS, ZRAM, SquashFS, F2FS, Kernel,
InitRAMFS). I also tested Kernel & InitRAMFS on i386 and aarch64. I checked both
performance and correctness.

Also, thanks to many people in the community who have tested these patches locally.
If you have tested the patches, please reply with a Tested-By so I can collect them
for the PR I will send to Linus.

Lastly, this code will bake in linux-next before being merged into v5.16.

Why update to zstd-1.4.10 when zstd-1.5.0 has been released?
------------------------------------------------------------

This patchset has been outstanding since 2020, and zstd-1.4.10 was the latest
release when it was created. Since the update patch is automatically generated
from upstream, I could generate it from zstd-1.5.0. However, there were some
large stack usage regressions in zstd-1.5.0, and are only fixed in the latest
development branch. And the latest development branch contains some new code that
needs to bake in the fuzzer before I would feel comfortable releasing to the
kernel.

Once this patchset has been merged, and we've released zstd-1.5.1, we can update
the kernel to zstd-1.5.1, and exercise the update process.

You may notice that zstd-1.4.10 doesn't exist upstream. This release is an
artifical release based off of zstd-1.4.9, with some fixes for the kernel
backported from the development branch. I will tag the zstd-1.4.10 release after
this patchset is merged, so the Linux Kernel is running a known version of zstd
that can be debugged upstream.

Why was a wrapper API added?
----------------------------

The first versions of this patchset migrated the kernel to the upstream zstd
API. It first added a shim API that supported the new upstream API with the old
code, then updated callers to use the new shim API, then transitioned to the
new code and deleted the shim API. However, Cristoph Hellwig suggested that we
transition to a kernel style API, and hide zstd's upstream API behind that.
This is because zstd's upstream API is supports many other use cases, and does
not follow the kernel style guide, while the kernel API is focused on the
kernel's use cases, and follows the kernel style guide.

Changelog
---------

v1 -> v2:
* Successfully tested F2FS with help from Chao Yu to fix my test.
* (1/9) Fix ZSTD_initCStream() wrapper to handle pledged_src_size=0 means unknown.
  This fixes F2FS with the zstd-1.4.6 compatibility wrapper, exposed by the test.

v2 -> v3:
* (3/9) Silence warnings by Kernel Test Robot:
  https://github.com/facebook/zstd/pull/2324
  Stack size warnings remain, but these aren't new, and the functions it warns on
  are either unused or not in the maximum stack path. This patchset reduces zstd
  compression stack usage by 1 KB overall. I've gotten the low hanging fruit, and
  more stack reduction would require significant changes that have the potential
  to introduce new bugs. However, I do hope to continue to reduce zstd stack
  usage in future versions.

v3 -> v4:
* (3/9) Fix errors and warnings reported by Kernel Test Robot:
  https://github.com/facebook/zstd/pull/2326
  - Replace mem.h with a custom kernel implementation that matches the current
    lib/zstd/mem.h in the kernel. This avoids calls to __builtin_bswap*() which
    don't work on certain architectures, as exposed by the Kernel Test Robot.
  - Remove ASAN/MSAN (un)poisoning code which doesn't work in the kernel, as
    exposed by the Kernel Test Robot.
  - I've fixed all of the valid cppcheck warnings reported, but there were many
    false positives, where cppcheck was incorrectly analyzing the situation,
    which I did not fix. I don't believe it is reasonable to expect that upstream
    zstd silences all the static analyzer false positives. Upstream zstd uses
    clang scan-build for its static analysis. We find that supporting multiple
    static analysis tools multiplies the burden of silencing false positives,
    without providing enough marginal value over running a single static analysis
    tool.

v4 -> v5:
* Rebase onto v5.10-rc2
* (6/9) Merge with other F2FS changes (no functional change in patch).

v5 -> v6:
* Rebase onto v5.10-rc6.
* Switch to using a kernel style wrapper API as suggested by Cristoph.

v6 -> v7:
* Expose the upstream library header as `include/linux/zstd_lib.h`.
  Instead of creating new structs mirroring the upstream zstd structs
  use upstream's structs directly with a typedef to get a kernel style name.
  This removes the memcpy cruft.
* (1/3) Undo ZSTD_WINDOWLOG_MAX and handle_zstd_error changes.
* (3/3) Expose zstd_errors.h as `include/linux/zstd_errors.h` because it
  is needed by the kernel wrapper API.

v7 -> v8:
* (1/3) Fix typo in EXPORT_SYMBOL().
* (1/3) Fix typo in zstd.h comments.
* (3/3) Update to latest zstd release: 1.4.6 -> 1.4.10
        This includes ~1KB of stack space reductions.

v8 -> v9:
* (1/3) Rebase onto v5.12-rc5
* (1/3) Add zstd_min_clevel() & zstd_max_clevel() and use in f2fs.
        Thanks to Oleksandr Natalenko for spotting it!
* (1/3) Move lib/decompress_unzstd.c usage of ZSTD_getErrorCode()
        to zstd_get_error_code().
* (1/3) Update modified zstd headers to yearless copyright.
* (2/3) Add copyright/license header to decompress_sources.h for consistency.
* (3/3) Update to yearless copyright for all zstd files. Thanks to
        Mike Dolan for spotting it!

v9 -> v10:
* Add a 4th patch in the series which adds an entry for zstd to MAINTAINERS.

v10 -> v11:
* Rebase cleanly onto v5.12-rc8
* (3/4) Replace invalid kernel style comments in zstd with regular comments.
        Thanks to Randy Dunlap for the suggestion.

v11 -> v12:
* Re-write the cover letter & send as a PR only.
* Rebase cleanly onto 5.15-rc4.
* (3/4) Clean up licensing to reflect that we're GPL-2.0+ OR BSD-3-Clause.
* (3/4) Reduce compression stack usage by 80 bytes.
* (3/4) Make upstream zstd `-Wfall-through` compliant and use the FALLTHROUGH
        macro in the Linux Kernel.

Signed-off-by: Nick Terrell <terrelln@fb.com>
Tested By: Paul Jones <paul@pauljones.id.au>
Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>

----------------------------------------------------------------
Nick Terrell (4):
      lib: zstd: Add kernel-specific API
      lib: zstd: Add decompress_sources.h for decompress_unzstd
      lib: zstd: Upgrade to latest upstream zstd version 1.4.10
      MAINTAINERS: Add maintainer entry for zstd

 MAINTAINERS                                    |   12 +
 crypto/zstd.c                                  |   28 +-
 fs/btrfs/zstd.c                                |   68 +-
 fs/f2fs/compress.c                             |   56 +-
 fs/f2fs/super.c                                |    2 +-
 fs/pstore/platform.c                           |    2 +-
 fs/squashfs/zstd_wrapper.c                     |   16 +-
 include/linux/zstd.h                           | 1252 ++----
 include/linux/zstd_errors.h                    |   77 +
 include/linux/zstd_lib.h                       | 2432 +++++++++++
 lib/decompress_unzstd.c                        |   48 +-
 lib/zstd/Makefile                              |   46 +-
 lib/zstd/bitstream.h                           |  380 --
 lib/zstd/common/bitstream.h                    |  437 ++
 lib/zstd/common/compiler.h                     |  170 +
 lib/zstd/common/cpu.h                          |  194 +
 lib/zstd/common/debug.c                        |   24 +
 lib/zstd/common/debug.h                        |  101 +
 lib/zstd/common/entropy_common.c               |  357 ++
 lib/zstd/common/error_private.c                |   56 +
 lib/zstd/common/error_private.h                |   66 +
 lib/zstd/common/fse.h                          |  710 ++++
 lib/zstd/common/fse_decompress.c               |  390 ++
 lib/zstd/common/huf.h                          |  356 ++
 lib/zstd/common/mem.h                          |  259 ++
 lib/zstd/common/zstd_common.c                  |   83 +
 lib/zstd/common/zstd_deps.h                    |  125 +
 lib/zstd/common/zstd_internal.h                |  450 +++
 lib/zstd/compress.c                            | 3485 ----------------
 lib/zstd/compress/fse_compress.c               |  625 +++
 lib/zstd/compress/hist.c                       |  165 +
 lib/zstd/compress/hist.h                       |   75 +
 lib/zstd/compress/huf_compress.c               |  905 +++++
 lib/zstd/compress/zstd_compress.c              | 5109 ++++++++++++++++++++++++
 lib/zstd/compress/zstd_compress_internal.h     | 1188 ++++++
 lib/zstd/compress/zstd_compress_literals.c     |  158 +
 lib/zstd/compress/zstd_compress_literals.h     |   29 +
 lib/zstd/compress/zstd_compress_sequences.c    |  439 ++
 lib/zstd/compress/zstd_compress_sequences.h    |   54 +
 lib/zstd/compress/zstd_compress_superblock.c   |  850 ++++
 lib/zstd/compress/zstd_compress_superblock.h   |   32 +
 lib/zstd/compress/zstd_cwksp.h                 |  482 +++
 lib/zstd/compress/zstd_double_fast.c           |  519 +++
 lib/zstd/compress/zstd_double_fast.h           |   32 +
 lib/zstd/compress/zstd_fast.c                  |  496 +++
 lib/zstd/compress/zstd_fast.h                  |   31 +
 lib/zstd/compress/zstd_lazy.c                  | 1412 +++++++
 lib/zstd/compress/zstd_lazy.h                  |   81 +
 lib/zstd/compress/zstd_ldm.c                   |  686 ++++
 lib/zstd/compress/zstd_ldm.h                   |  110 +
 lib/zstd/compress/zstd_ldm_geartab.h           |  103 +
 lib/zstd/compress/zstd_opt.c                   | 1345 +++++++
 lib/zstd/compress/zstd_opt.h                   |   50 +
 lib/zstd/decompress.c                          | 2531 ------------
 lib/zstd/decompress/huf_decompress.c           | 1206 ++++++
 lib/zstd/decompress/zstd_ddict.c               |  241 ++
 lib/zstd/decompress/zstd_ddict.h               |   44 +
 lib/zstd/decompress/zstd_decompress.c          | 2082 ++++++++++
 lib/zstd/decompress/zstd_decompress_block.c    | 1540 +++++++
 lib/zstd/decompress/zstd_decompress_block.h    |   62 +
 lib/zstd/decompress/zstd_decompress_internal.h |  202 +
 lib/zstd/decompress_sources.h                  |   28 +
 lib/zstd/entropy_common.c                      |  243 --
 lib/zstd/error_private.h                       |   53 -
 lib/zstd/fse.h                                 |  575 ---
 lib/zstd/fse_compress.c                        |  795 ----
 lib/zstd/fse_decompress.c                      |  325 --
 lib/zstd/huf.h                                 |  212 -
 lib/zstd/huf_compress.c                        |  773 ----
 lib/zstd/huf_decompress.c                      |  960 -----
 lib/zstd/mem.h                                 |  151 -
 lib/zstd/zstd_common.c                         |   75 -
 lib/zstd/zstd_compress_module.c                |  160 +
 lib/zstd/zstd_decompress_module.c              |  105 +
 lib/zstd/zstd_internal.h                       |  273 --
 lib/zstd/zstd_opt.h                            | 1014 -----
 76 files changed, 27367 insertions(+), 12941 deletions(-)
 create mode 100644 include/linux/zstd_errors.h
 create mode 100644 include/linux/zstd_lib.h
 delete mode 100644 lib/zstd/bitstream.h
 create mode 100644 lib/zstd/common/bitstream.h
 create mode 100644 lib/zstd/common/compiler.h
 create mode 100644 lib/zstd/common/cpu.h
 create mode 100644 lib/zstd/common/debug.c
 create mode 100644 lib/zstd/common/debug.h
 create mode 100644 lib/zstd/common/entropy_common.c
 create mode 100644 lib/zstd/common/error_private.c
 create mode 100644 lib/zstd/common/error_private.h
 create mode 100644 lib/zstd/common/fse.h
 create mode 100644 lib/zstd/common/fse_decompress.c
 create mode 100644 lib/zstd/common/huf.h
 create mode 100644 lib/zstd/common/mem.h
 create mode 100644 lib/zstd/common/zstd_common.c
 create mode 100644 lib/zstd/common/zstd_deps.h
 create mode 100644 lib/zstd/common/zstd_internal.h
 delete mode 100644 lib/zstd/compress.c
 create mode 100644 lib/zstd/compress/fse_compress.c
 create mode 100644 lib/zstd/compress/hist.c
 create mode 100644 lib/zstd/compress/hist.h
 create mode 100644 lib/zstd/compress/huf_compress.c
 create mode 100644 lib/zstd/compress/zstd_compress.c
 create mode 100644 lib/zstd/compress/zstd_compress_internal.h
 create mode 100644 lib/zstd/compress/zstd_compress_literals.c
 create mode 100644 lib/zstd/compress/zstd_compress_literals.h
 create mode 100644 lib/zstd/compress/zstd_compress_sequences.c
 create mode 100644 lib/zstd/compress/zstd_compress_sequences.h
 create mode 100644 lib/zstd/compress/zstd_compress_superblock.c
 create mode 100644 lib/zstd/compress/zstd_compress_superblock.h
 create mode 100644 lib/zstd/compress/zstd_cwksp.h
 create mode 100644 lib/zstd/compress/zstd_double_fast.c
 create mode 100644 lib/zstd/compress/zstd_double_fast.h
 create mode 100644 lib/zstd/compress/zstd_fast.c
 create mode 100644 lib/zstd/compress/zstd_fast.h
 create mode 100644 lib/zstd/compress/zstd_lazy.c
 create mode 100644 lib/zstd/compress/zstd_lazy.h
 create mode 100644 lib/zstd/compress/zstd_ldm.c
 create mode 100644 lib/zstd/compress/zstd_ldm.h
 create mode 100644 lib/zstd/compress/zstd_ldm_geartab.h
 create mode 100644 lib/zstd/compress/zstd_opt.c
 create mode 100644 lib/zstd/compress/zstd_opt.h
 delete mode 100644 lib/zstd/decompress.c
 create mode 100644 lib/zstd/decompress/huf_decompress.c
 create mode 100644 lib/zstd/decompress/zstd_ddict.c
 create mode 100644 lib/zstd/decompress/zstd_ddict.h
 create mode 100644 lib/zstd/decompress/zstd_decompress.c
 create mode 100644 lib/zstd/decompress/zstd_decompress_block.c
 create mode 100644 lib/zstd/decompress/zstd_decompress_block.h
 create mode 100644 lib/zstd/decompress/zstd_decompress_internal.h
 create mode 100644 lib/zstd/decompress_sources.h
 delete mode 100644 lib/zstd/entropy_common.c
 delete mode 100644 lib/zstd/error_private.h
 delete mode 100644 lib/zstd/fse.h
 delete mode 100644 lib/zstd/fse_compress.c
 delete mode 100644 lib/zstd/fse_decompress.c
 delete mode 100644 lib/zstd/huf.h
 delete mode 100644 lib/zstd/huf_compress.c
 delete mode 100644 lib/zstd/huf_decompress.c
 delete mode 100644 lib/zstd/mem.h
 delete mode 100644 lib/zstd/zstd_common.c
 create mode 100644 lib/zstd/zstd_compress_module.c
 create mode 100644 lib/zstd/zstd_decompress_module.c
 delete mode 100644 lib/zstd/zstd_internal.h
 delete mode 100644 lib/zstd/zstd_opt.h
