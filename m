Return-Path: <linux-next+bounces-8775-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 554CEC24506
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 11:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2837F4F5CD2
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 09:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B05E34D3B5;
	Fri, 31 Oct 2025 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kimAkg96"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F7A2EC55C
	for <linux-next@vger.kernel.org>; Fri, 31 Oct 2025 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904747; cv=none; b=RUZEa6Wz+vq4tWn3gk4MM/aOmoHpdZQKonwSZ3k/LYQmfP73mAAAM3vDIgd4W4QnOEGzFIPqSKlsX6FNom3KSb9I0PdEVyoWhJmmaY0f0L2I/j3YoH+JzmbD17Y3RjmooKvZao6HPRIhRyZMShuBry4+F84kLqIMGIRcEjvb6tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904747; c=relaxed/simple;
	bh=x/3eBVamsc4GqUrJq5weZRDQbBkuwwO8bW175DzPy7Q=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=NV+n6ohE2SBNwqm83jTBV8ReOvcvVKHpKbbQLSBaSyiHgqfD35NtQ2aKoWhG4ls4Rh2BerxU/gxF9OFJS4JIlSFaqLTde5JBjSKtfDRq8weCzYkVD01osps+19RIGVKikVFgsqG3ml/ljdFLs5xlsOdYxpZaHi8vmypKnfB6xdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=kimAkg96; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34077439166so1231110a91.2
        for <linux-next@vger.kernel.org>; Fri, 31 Oct 2025 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761904745; x=1762509545; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+KxFg2hHmVV0FcfqSk/4uQgiBa9mkwAKfZcNRO5L08=;
        b=kimAkg963Ks1MYNcborCMi6Ymi6tCifC++/vtLDBCnMlIiOaQz5txMzAVLoYuyvWBD
         t9WZusX/fzV2/JrYmjjol1BOa4G6jZ5D5s1jF9qP9Qe7z0xFM6ZDsKpee72bpc9XNIoj
         +pPaxmrLdK654yk/QH+DRGVz6IMIw5HhqO7JWUd1ZHeBSrqDDN7Chexlmdw5F3lMlFhw
         H7UE4TyT23KZRwvn6oIld/j2VI4pLcw7diMR7s8GE+Yfpwcjl+j6UClJlf4K21iqPxkH
         qLQZ9FLVy8AIIxTlnSlNmjDbX8RhPYMUfc5uDvKKTz6hzX5baTYiHbXAmtRlKX0R72xC
         sAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904745; x=1762509545;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c+KxFg2hHmVV0FcfqSk/4uQgiBa9mkwAKfZcNRO5L08=;
        b=MTuccy7EaVGsZ5x3wRz4i7QUy7DjsGeoFQMOJZdmZsMatCSrMgcDdZ+Lu6qXV3M+M9
         4ksEX7/Nv46b2OQ3GHAOJnmDN4rceBABpG9ijHzoe+Wq4WmFTSU/w4t0TC5J1GZhV4jE
         awRqS3uM5UEzlMz6/t28hNxGnKYVdPSZ1ZDLDFik3itl3Wwe5/O4AntsyAwVL0qA14DR
         CEnF99/JBs0Xg7QFh0/z36wItOHwgewZB+t4+mUOxSRTCiTsGd2PZE/zNsJP5Aixkg0u
         1afRUdEtczVePePSxywppy/yGlDMxtoBWa91+uZwSYZ3Fw2zg3UXvcNewZFjDbqafOV8
         8V5g==
X-Forwarded-Encrypted: i=1; AJvYcCUne0fLKot2buHQNy4jfGjkwvem8lGMBDCA2z2LkPGVZxCSVeXnjBBkpwa+0NdbBACkQrMRZNsyJvdq@vger.kernel.org
X-Gm-Message-State: AOJu0YxZsotT4uvFQziB8Qzk9us6RDiWFz0Nx6bkFepk3s+c7Qy5vgy1
	3ZPJGauVKIEbKK3N9GHQqwQ5R/aBa/dJUTtYOa3NZ7y+JuYcPjlPnkh9Nuw07bcEpis=
X-Gm-Gg: ASbGnctDNol4UifZA84gXIGWDUGVxb0585mhNQtIJzA+/iWyJrC22G0L9RZ5/zFRrw/
	63M1C7CfwX4tjMUygJKoQSb7Z33mjn3n0u6eQ1XRNlav6FQF6SeLWaVwCCFSj9Ubjfan2nm5XBq
	lonXARxbdG+7YPU6AsSvEXhgo3v9fa50IxktwJLk5Yg9uU64HTCO3Y/DrTdAHOpQgRpS+GebpUB
	RsC6NVaqgNu2uT2oL5XzxjDyVEZNkZ0V957kifw9RPPUQNPEzG4JDDlbdjVP93YSNi2AVF9DpJ5
	4OJJtAOUbOawK5MAmHZ3+wMQpQLNAuMBcCictIWtaSfjgTUbXt6Gm790kihYWtS9/mcyfooFpx9
	lh3QWzUC57DPT1/tpT2pTk7bN3GsJ0KbtP9yDH2Lr8vZRV7Ikv4QKZWlvakKZB9Gij5Y90Q==
X-Google-Smtp-Source: AGHT+IGhx+G3o9Z0D8X22dILTC6yUkzqdjqbZ5enawSqrYUe8rajYu1ZzF+A8K1y7RUa/nhOEVyrvg==
X-Received: by 2002:a17:902:d485:b0:269:6052:3536 with SMTP id d9443c01a7336-2951a4ffb0cmr38441365ad.45.1761904744850;
        Fri, 31 Oct 2025 02:59:04 -0700 (PDT)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268b52dasm17711105ad.38.2025.10.31.02.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [REGRESSION] next/master: (build)
 ./arch/riscv/include/asm/vdso/processor.h:23:2: error: expected in...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 31 Oct 2025 09:59:03 -0000
Message-ID: <176190474357.1783.9326055147559573063@efdf33580483>





Hello,

New build issue found on next/master:

---
 ./arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format in arch/riscv/kernel/vdso/vgettimeofday.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:cd79512a03e4fd8760092dacf80363de08e082d1
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
- tags: next-20251031


Log excerpt:
=====================================================
  CC      arch/riscv/kernel/vdso/vgettimeofday.o
  AS      arch/riscv/kernel/vdso/getcpu.o
  AS      arch/riscv/kernel/vdso/flush_icache.o
  CC      arch/riscv/kernel/vdso/hwprobe.o
  AS      arch/riscv/kernel/vdso/sys_hwprobe.o
  CC      arch/riscv/kernel/vdso/getrandom.o
  AS      arch/riscv/kernel/vdso/note.o
  AS      arch/riscv/kernel/vdso/vgetrandom-chacha.o
In file included from <built-in>:4:
In file included from /tmp/kci/linux/lib/vdso/gettimeofday.c:6:
In file included from ./include/vdso/datapage.h:21:
In file included from ./include/vdso/processor.h:10:
./arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
   23 |         ALT_RISCV_PAUSE();
      |         ^
./arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
   47 |                 RISCV_PAUSE, /* Original RISC‑V pause insn */ \
      |                 ^
./arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
  259 | #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
      |                         ^
./arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   16 | #define ASM_INSN_I(__x) ".insn " __x
      |                          ^
<inline asm>:5:7: note: instantiated into assembly here
    5 | .insn 0x100000f
      |       ^
In file included from <built-in>:4:
In file included from /tmp/kci/linux/lib/vdso/gettimeofday.c:6:
In file included from ./include/vdso/datapage.h:21:
In file included from ./include/vdso/processor.h:10:
./arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
   23 |         ALT_RISCV_PAUSE();
      |         ^
./arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
   47 |                 RISCV_PAUSE, /* Original RISC‑V pause insn */ \
      |                 ^
./arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
  259 | #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
      |                         ^
./arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   16 | #define ASM_INSN_I(__x) ".insn " __x
      |                          ^
<inline asm>:5:7: note: instantiated into assembly here
    5 | .insn 0x100000f
      |       ^
In file included from <built-in>:4:
In file included from /tmp/kci/linux/lib/vdso/gettimeofday.c:6:
In file included from ./include/vdso/datapage.h:21:
In file included from ./include/vdso/processor.h:10:
./arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
   23 |         ALT_RISCV_PAUSE();
      |         ^
./arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
   47 |                 RISCV_PAUSE, /* Original RISC‑V pause insn */ \
      |                 ^
./arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
  259 | #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
      |                         ^
./arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   16 | #define ASM_INSN_I(__x) ".insn " __x
      |                          ^
<inline asm>:5:7: note: instantiated into assembly here
    5 | .insn 0x100000f
      |       ^
3 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allnoconfig on (riscv):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-riscv-defconfig-6904853b9df0fb426d143b46/.config
- dashboard: https://d.kernelci.org/build/maestro:6904853b9df0fb426d143b46


#kernelci issue maestro:cd79512a03e4fd8760092dacf80363de08e082d1

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

