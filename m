Return-Path: <linux-next+bounces-7928-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF8AB23FF7
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 06:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8276C7A3DDB
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 04:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E9429BD97;
	Wed, 13 Aug 2025 04:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="D+HF+dVF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E7523D7C6
	for <linux-next@vger.kernel.org>; Wed, 13 Aug 2025 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755061147; cv=none; b=ZT1yLWTGDd9ufr97aaFTDXZelAQ5zmtt7QL93IkB4M28xizR3ycueL7gv18laVnNU887pae6zQqSH7p2/k0/p6HmScvR5ZwalfCXBKlY2ijp6l2JTMWedynkzmTU1Rz4iDUKFojsjEnx3QQ72CWJBxqL2d1aKB4JPC3tCR1mdcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755061147; c=relaxed/simple;
	bh=UCKIbwhf6uvstIcUIZCOqEh6axnb7CKLlDgXzZHKcxM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Ibs3ZAs+eJN2sNGFC8wIUn5sbtf+LxH+Exm9PfFNDdu/VTbOUhdfaIxlwoAMOYh0ywq1YGbzNUw00lE21U9loTF8De9jnUNWRqTRnpJhBa1BlecaLdgr29Lks7ur4ZkHqbR6rQrtjA3Hah+ON+IfGocT77cKyQwP8+oemPW0LSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=D+HF+dVF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23fe2be6061so3870135ad.0
        for <linux-next@vger.kernel.org>; Tue, 12 Aug 2025 21:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755061145; x=1755665945; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXbqQzre0I9aot+SgweTk1NUAuEOQ8POr6v/qgJLq5g=;
        b=D+HF+dVFjdVBDJ87+ZyLTDWaKMky0zw2Zdh4mvFfLMsevQe9OXwiKsQ8TaKbPLn8io
         g6UKx3cih30j+zfmFZc4/kIK6lYB9HV6BN7h8v4IV7RIPMIzO8bIAw6lZ9d20q4MWHJD
         th30YJWOdLFUsqhDq0aj+OxbUT7P5ZBw6+oQc/BZDFjI6gLzUs1od3hfuEI1iSUUkGlL
         l6vCjSaYweF6v17lNDVZ9dPNuktxBzp3OW7DO4aFY9ZxVAXbsXLNF8Rj3SX3mPNUhj3X
         4DIKavrxvXvxMCEvqkKo7bAJmn6sCyVOTOKpP8RmcpbIdEtL5ODkB/5EpOx3YuOh88m3
         eA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755061145; x=1755665945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HXbqQzre0I9aot+SgweTk1NUAuEOQ8POr6v/qgJLq5g=;
        b=BIoV4x0Er2CmiSXG+QYBmebKWWascbOoUkOyuwxpTrx5alJjKQAxYI7XK7Dke+xsv0
         gUoRWWJlqOn79Z0IGFwRf5RbHPFWDmHprmIteBeIQ4sZsYfeQx+BP4tyKl39Hp7x2C8D
         M4RQCo84OxPWTOtN7p9G8CXAj3gFEOiK+h5yCegucjQZh9bwWFJUD02zazCZWueDdLFD
         9g4TJ46qY6WUeLJzFxi3zkASKApXOBkFNfYRTzYPG0xXe8TTzv91ly0Wx/uZnOIYORJK
         95/wrb0TxjeB89S3Gc6eRf1sEQ5ZxgieHhC45592IpIWKRSPreP3Nmk2UPUHyk4z/mrj
         okGA==
X-Forwarded-Encrypted: i=1; AJvYcCWhfYTvW8EObBVH22ijg5FTZeikqabsnP0dFa/TXhjYO0D8HAggh5RY6nHoVx7lnMgd7tdThUyQkDwL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqcz8lLrfRq9E4xpYcp2cgao7ljTDHn8h+WIOVVznG1S3O8pbE
	2ucfrU7T1IB+YcBUtxGA5M/57lU42tEhaNVHeRaR7cj7nu0drXlDPBdcdKkRUKAK7v8=
X-Gm-Gg: ASbGnctxaC4z5JTngR97wiuIfApWJsn5qRAwTAA+oh2asvu4go1dvdZGefj0SOxDW1Q
	i8ofyVeWajD6sbf+jB78PKgJv89JoSqoGjHxhkGxLIW4E7kmDHUJvf38voa6DWLVrBkg7hZmvRu
	XvYThrRm/NTtI9fE5bhFmE5OTs+EJZlHWBXw1orAisDXyQS06tqwu78yOva7kCFgpsLQIQhGD2/
	Bezw40nIniIvYTVcSYaGI12DmwwWoC2s9VBJViPeuRMykzJLysXSSNzAtP8m5tcgNeEv/NSjSYh
	BvHSNB6ULrFy/xDqHGGkV+NdiLQu+QL0YKLNRr7JUFK26TcTlC0Q0Q/8uWwL5JTOceARokwx20r
	JvAwBY2SJPwr26Tmd
X-Google-Smtp-Source: AGHT+IE70uDjTEdyeWd+C2sup7LRABQQn3vho5Md0rv+MJ5Rx9cXzm1VLhTjjwqtnzoXbduwZu7rPg==
X-Received: by 2002:a17:902:e74a:b0:240:72d8:96fa with SMTP id d9443c01a7336-2430eaa42b0mr18746945ad.20.1755061145319;
        Tue, 12 Aug 2025 21:59:05 -0700 (PDT)
Received: from 99cfaf6094a7 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef59b2sm316509585ad.7.2025.08.12.21.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 21:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build)
 ./include/linux/iov_iter.h:171:7:
 error: variable 'remain' is used...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 13 Aug 2025 04:59:04 -0000
Message-ID: <175506114403.296.12737351814093118427@99cfaf6094a7>





Hello,

New build issue found on next/pending-fixes:

---
 ./include/linux/iov_iter.h:171:7: error: variable 'remain' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized] in net/core/skbuff.o (net/core/skbuff.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:e3e604796d8d054968bf2b979c7940708d16e0ee
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  1b07edbd37d5ab410613ebe09b0641d0f4fe717b



Log excerpt:
=====================================================
In file included from net/core/skbuff.c:66:
./include/linux/iov_iter.h:171:7: error: variable 'remain' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
  171 |                 if (skip >= fsize)
      |                     ^~~~~~~~~~~~~
./include/linux/iov_iter.h:190:7: note: uninitialized use occurs here
  190 |                 if (remain)
      |                     ^~~~~~
./include/linux/iov_iter.h:171:3: note: remove the 'if' if its condition is always false
  171 |                 if (skip >= fsize)
      |                 ^~~~~~~~~~~~~~~~~~
  172 |                         goto next;
      |                         ~~~~~~~~~
./include/linux/iov_iter.h:163:22: note: initialize the variable 'remain' to silence this warning
  163 |                 size_t part, remain, consumed;
      |                                    ^
      |                                     = 0
  CC      drivers/pci/search.o
  CC      sound/core/seq/seq_dummy.o
  CC      lib/ctype.o
  CC      lib/dec_and_lock.o
  AR      sound/i2c/other/built-in.a
  AR      sound/i2c/built-in.a
  CC      kernel/fork.o
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:689c1610233e484a3f9165be

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:689c1617233e484a3f9165c4


#kernelci issue maestro:e3e604796d8d054968bf2b979c7940708d16e0ee

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

