Return-Path: <linux-next+bounces-725-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5796C82AC8F
	for <lists+linux-next@lfdr.de>; Thu, 11 Jan 2024 11:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8DD02814EC
	for <lists+linux-next@lfdr.de>; Thu, 11 Jan 2024 10:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8CE14F9D;
	Thu, 11 Jan 2024 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hqo3GP2l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4C14F73
	for <linux-next@vger.kernel.org>; Thu, 11 Jan 2024 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4b743ca0597so1248353e0c.1
        for <linux-next@vger.kernel.org>; Thu, 11 Jan 2024 02:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704970400; x=1705575200; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2BxDnRoz+tciUL07Ky2uFARoSUgYzDQPvPnOjHTato0=;
        b=Hqo3GP2lJCMKqLmYn2+9q484HUZWZtzf4WfqHBTv3jtDgavmGh5V4ZTDzf+zF3b09Y
         9HwqlCE4aeGeuT61qxsG+6e2mX7IGSXgO/VRlPIY2Ml1E8R09oQ48Daj9hSNI+lHQC0D
         +SNvC5VUfrz9LYD8R7/bVw4XGmZxUhpYZN0jwaO5XmYlnVxfzXDjh/WaAsE1esmeR0WA
         3fuxDERF/StbK9mU/+4oxlPcAkN6PfGyYxJT2ZamMhfrasnupQns338wKUljxEBqf4tN
         QUarxmOQHbi2yrBxe0lI7y/v2LH2fMmx/IW/F1phr/zyN8boO+zGSKnlj/JDzVCOWVGe
         du9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704970400; x=1705575200;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2BxDnRoz+tciUL07Ky2uFARoSUgYzDQPvPnOjHTato0=;
        b=dforzA1gymFlsj32KcY3PB+kUEiWqi66GMFCw0xKsB1Cc7HtgORPjkVI3dYXzqRolb
         0lgrm+pSiMEDM52+w9YjsTlE1T7wZymWFsTayIEPaeBVTAyOZDfZwVPYUXYrBlktOuHW
         2TxenEvO5dAVnTkKv9a/8/2BGXepYSRwKhIK6XUOnmwXu4YOyZ5yOSag0Se7/AM9MRkL
         3p22s+1uvSST2TL2eRvoflrJz2XnONXgESepEGQ9956F/i1avWNQPFviSapMo620b0NQ
         KkypBmcB1+rV4sHiLio3BDoLNm4Ga2PNMcE/5azT0ugNsbVAJeOGHp63MR1Yvgm+gC2y
         eKKg==
X-Gm-Message-State: AOJu0Yyctz0PuMXwuYuOyNFRCSvjmBSEpVc+vAIA9pHpElTWQ1xzg9dv
	u63DeBSXc3sXPGJRcpFnNlFluhsXMNe77UGvKTsz3lVhP4F4bn4Sl/4H5UjyxG4=
X-Google-Smtp-Source: AGHT+IGgSmqv9Y1WJTe266dMtLWoOwKf822h2X6Qyg98fN6FvdHnX82UlDzXJD8BpoL+3lFdSku871Xabj7RMWn9Q/Q=
X-Received: by 2002:a05:6122:1499:b0:4b7:8d7c:3483 with SMTP id
 z25-20020a056122149900b004b78d7c3483mr254720vkp.19.1704970400539; Thu, 11 Jan
 2024 02:53:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 11 Jan 2024 16:23:09 +0530
Message-ID: <CA+G9fYvDNksfKNvtfERaBa9t2MJNucfD_s3LgKGw_z2otW+nyw@mail.gmail.com>
Subject: mm/vmalloc.c:4691:25: error: variable 'addr' is uninitialized when
 used here [-Werror,-Wuninitialized]
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>, 
	lkft-triage@lists.linaro.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Following build failures noticed on i386 and x86 with clang builds on the
Linux next-20240111 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
----------
mm/vmalloc.c:4691:25: error: variable 'addr' is uninitialized when
used here [-Werror,-Wuninitialized]
 4691 |                 va = __find_vmap_area(addr, &vn->busy.root);
      |                                       ^~~~
mm/vmalloc.c:4684:20: note: initialize the variable 'addr' to silence
this warning
 4684 |         unsigned long addr;
      |                           ^
      |                            = 0
1 error generated.

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240111/testrun/22036090/suite/build/test/clang-lkftconfig/details/

--
Linaro LKFT
https://lkft.linaro.org

