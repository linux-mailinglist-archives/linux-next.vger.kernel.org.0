Return-Path: <linux-next+bounces-8701-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C8C041E7
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 04:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 465813B735F
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 02:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C8B14B06C;
	Fri, 24 Oct 2025 02:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Z99yphn7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1EA132117
	for <linux-next@vger.kernel.org>; Fri, 24 Oct 2025 02:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761273051; cv=none; b=U/2j+7fUaI3phyYlmDsES41/uW1ItqADPZR3XaQCrEyVSvJ8QEMTbz6V6whmHHP2yn5M7ubfpH71cuIM5Ko0srUQhRRNuwoxbzZsTLegtw8sRD4+MO7V1mRnQAD5i+/Bh0ELU1oRkeibA7Rvo+xduIL5tmu2a8C4dqAglzujVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761273051; c=relaxed/simple;
	bh=x3VLUA9rFstwZvSH6r+V72iPfZg5n9ql92TXaf1SCnc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=esVaCf0svtSbphEOUAVipXaYfO+7G2tWG7Dx8lekAVTCQTqI0PrMLk2OHRMT34aGMokFcNlwBE2zOLcyHj/o1uj8B5HS6k1lD3Escs3wWxEhkv3rWgsHZtz0hKeYWOliTJ3RfeiwHAXsM9DeyjPThFLlIIB6cOZvteSZJVT5adI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Z99yphn7; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32ec291a325so1199702a91.1
        for <linux-next@vger.kernel.org>; Thu, 23 Oct 2025 19:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761273048; x=1761877848; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f71JXx+dozy2t+etLNCt5JEDtVnXgnyASGl1T4H3uEk=;
        b=Z99yphn7rOBXXTjc3Nxu0Zu3fCQOE2uxbnqgboHt0NjBYg5FVlDRrUYDRkotyUku8Z
         TfloATFxaNQL9Q0QS208N9w7Q9l469m9ieaT/0HhjXmJrQywHnoTPRNlJT1o/CP6Bt/1
         x0n8mXGs+bB6Bcfb36+Tx4zCPmDCH+IXFxkbkdfWTbuCI/cKA8i2Qf7JkfdpaByD5856
         a21tXw875BfVD3PQOHqBAXFofVIF+sUoOiCr7WPCWVysl1tT/N5tHQiWcE7asdNghMJn
         Vg5a8t5lE/qzFa6+MmR8VtrUxahhun0O2ASA9RWm10XmS+orwCdTX+Lj1Z9Zr3LSs/3/
         h8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761273048; x=1761877848;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f71JXx+dozy2t+etLNCt5JEDtVnXgnyASGl1T4H3uEk=;
        b=EF7IQux2YsSWjGz5vjs1nMS14tUh3tk1JkKz35Psd+k09aG6u2h1d1oGDm5pLH8lnD
         vRE/jyfnWUPaX+xg9y86YyW5XJJauv8WuaHc40RJVmpJ1CD2Z5Cr0oIrJMMHeTUPITuh
         tvYlp6aGiefssEaS4nFIEkaB2QHC8pW2ZtdyGtpvQ/jRN9nAerNV0NFPwtSoxW9g6Ghs
         3htQ4iTsaV26MkkXvB3qZf6fKjt33jma/KbT4U0Sofyqgfvdj2vEtthA9YViEwAZyIZp
         qJC7AAL7XQf2/12d0yd2bbzL03pG/88Trsh4Rc1QdGEoijQ0yiw52KqX/rYfz05+EheJ
         Xm0w==
X-Gm-Message-State: AOJu0YwfuTMdWdDINLUqRaI3VmZGUE6bj6Ym1Vozs1tmFTrPnfsuMW6Z
	Xg4w/5rxkQUi7A4FF6G+tPTGJI4qooCZ03YfYuixCE5IsdgBc1DdUaj7740xqrtiqmg=
X-Gm-Gg: ASbGncvk0Xu5PcLy+R5am+JwYH7LrDxHyb/2SvScd8oYk+lZHQ4jgMv4C13qkhH/WBZ
	3/TGibhQnxLjPSPirtwhqsQSlLF/DEKKZhZ04BtyQBBBpXayI8Xg7rJd94kKVfW1JFoqmZwk2Av
	Oourpm10FiKyiL9uu7QaHM/aCpnxM3A9QNEBKpyWL+Kv0OMTe9pcJcUnWor3hYp3T6aQL7e4ysw
	XvzDop1tT49/Q9BqISEfQ36JQvnxl7heGZQX8hFQYc6iaca3Xlk7+z7+XRHDh7Fw5L5qAcnt4qB
	GimoJiEZ0YXqVtPkl/RE3b8vEehBwt3ytZD2cR2fmDgFbW4dsBMZkF0xQolH0TFfx/+xZZPAKzG
	hXaT1kY25FtJb4Y/B+Xgkd7VtWSSnr8+p8YFC6fpYL91Wnqh3elK4ctSm/Zrk8X8Uu48VxvIWlT
	djbQi9
X-Google-Smtp-Source: AGHT+IGw8NOAq+NvqskNmbRzggd0b/8x1amiW7WiDoR74iaQCOYTg6XiOpjrewGtqtHo41hY0t2N1A==
X-Received: by 2002:a17:90b:5623:b0:33b:d36f:a20d with SMTP id 98e67ed59e1d1-33bd36fa517mr32146000a91.37.1761273048313;
        Thu, 23 Oct 2025 19:30:48 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb0191b29sm3994876a91.19.2025.10.23.19.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 19:30:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - efb26a23ed5f5dc3554886ab398f559dcb1de96b
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 24 Oct 2025 02:30:47 -0000
Message-ID: <176127304705.6187.11537444922150533618@15dd6324cc71>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/efb26a23ed5f5dc3554886ab398f559dcb1de96b/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: efb26a23ed5f5dc3554886ab398f559dcb1de96b
origin: maestro
test start time: 2025-10-23 03:41:01.938000+00:00

Builds:	   33 ✅    8 ❌    0 ⚠️
Boots: 	  105 ✅    3 ❌    0 ⚠️
Tests: 	 4064 ✅ 1998 ❌ 2132 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kernelci_sleep
      last run: https://d.kernelci.org/test/maestro:68f9b0bd9533132a18993e3f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68f9b0329533132a18993ce1
      history:  > ✅  > ⚠️  > ✅  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:992b985637471b20dfed6cb78dc938315a3ba8b6 | version: 1
  Build: maestro:68f9a84f9533132a189903f3
  Comment:  cannot jump from this goto statement to its label in drivers/opp/of.o (drivers/opp/of.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-10-23 05:24:15.173919+00:00
  Culprit: code
- Issue: maestro:992b985637471b20dfed6cb78dc938315a3ba8b6 | version: 1
  Build: maestro:68f9a85f9533132a18990405
  Comment:  cannot jump from this goto statement to its label in drivers/opp/of.o (drivers/opp/of.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-10-23 05:24:15.173919+00:00
  Culprit: code


This branch has 6 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

