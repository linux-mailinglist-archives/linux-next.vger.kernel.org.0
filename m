Return-Path: <linux-next+bounces-8505-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C34EBA4BB2
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 18:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F04B74009A
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 16:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A521930C0EF;
	Fri, 26 Sep 2025 16:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Fz/NmyTW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D0C30BF62
	for <linux-next@vger.kernel.org>; Fri, 26 Sep 2025 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758905947; cv=none; b=nqNkUG681qHagRc49CJxaY+TbiWec5acrYM+bpMk6XvilWZiJzqZ2IEgflg3t/B7izHqsBVLMXoD9KinLaExsbHSYNMtDYhsQjodDBmnSrVKyDCPz+HkJsN52IGFs1ZnEBsVoVOq2KyxcqlP3a0V099Za6arfiMvtacAnQgJKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758905947; c=relaxed/simple;
	bh=ZDbPNNwTc2xllQRq1upDRo55Uwg02Ak3IPmyPJuzBbA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=FUVn/P4/i5Ygx4BleFXwj5t7ug+6ourJFKsbaYsSJamDNyyNT5tESZ6MSpVaBzKwC1yd9DoTc1d2u7luC+6PCyaEYEOiqdcg/Dq/TiGoVD9JiHZhv6+ouQqH+IpJrHsrPpbvMJz5AFKpSjJeNA1b4pCWCw42prW/BhQGTgQRYDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Fz/NmyTW; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so2505401a91.1
        for <linux-next@vger.kernel.org>; Fri, 26 Sep 2025 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758905945; x=1759510745; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9wF9E9YK/j++mNxViwWRBp72k3luVN6k0tCP2GBCao=;
        b=Fz/NmyTWF2Lox3Y3LmsTF3d9ziuavNbJN37Lw76NfmNsMv0X37g7oZFn+9z2J6WqDy
         eQrRSXVZog/z0Lya7+z36Y5EykV1J95o53ogxsCOmIP3VTg1PTFdid9rRXVYnZlD+rbn
         AnormlT7iNHLDepv9aDjryYPv6pZclBGmCpXld5FS5iFe2f2QOmqYW2rfC5f2f8PiqrK
         J24KvmXDFfgVn64WihVi8iXsH/VbuiA/drQJOwjrWToXjq0TnDlsEYcJCLUqkpLjqFuk
         c2eDQwjCDLY4ggiPuK9C9tPSyp/9OKKEhmQ6K+W782f4Hce4us4lEcv8KI7BymlJtjsI
         AKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758905945; x=1759510745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P9wF9E9YK/j++mNxViwWRBp72k3luVN6k0tCP2GBCao=;
        b=sbIewMoxO2eJCv2Xd+ioQHF12o9e4eq4m55q+DScGqXWcucCTu+zvundrHMZuOZ4ZR
         qVZoaQrieUsl6cz3mMKk3opBeXOCZO4UrTrrUEM/5PK0/oRXwVBwQSjOnSBIUXEEISlT
         2mLOIi1ypsm+X2HY7w0J4JH3cAXO2Ok77ka2QTYvIi5GEBufI2y7RDszOhAdAWtOhjr6
         F+Wn+fMVJfLPqgO8yilC5xmPKk1iWa4KtCT1Lft+ErT5llCG/Va5wQGu7ITI7U9l+Bbr
         xfG56tX2LeVfshaYlf2cf3PBI79l9rZ13XVHK73MCsSX4YquzvEgAiBU0P4AaJ/cvKio
         MS8g==
X-Forwarded-Encrypted: i=1; AJvYcCWBxazNt8SXyFCSB0UC00hsoCKlzA1RsgGhhhLe93q8FYe3B2fbidiTz8h8La7X99DbOq3uBxKlh9FI@vger.kernel.org
X-Gm-Message-State: AOJu0YzmOstKDI56Yho5yolEdjeTtziRYMUc4N+0+bSzADBIscswXFAI
	SNBhE5yV5NulHnWUlQyOJO+EFRG68yrI+ivun1TDvVNAqVmp3DsTlM1ldi9waqLaqbT7V8MJ75Q
	gWlON3rQ=
X-Gm-Gg: ASbGncvVF9HSK3xOcMSN5yZThtWOhHXCkfNyxjkVUqJYARb2o6KoloPIS1NeBJnq5P+
	7to0hwz+ht/3OYLf+30mf6ljBy1l7HbUPeujvXbYm0SAwHDZiSkmS963If9o2A8CyctQt/D66AI
	Ilq6PL8jjnVPv1RgRDRqksjp1g0jxUWFJsL31gm0RsHBVnBzt91cN8pS+oeJDDusITBrWQyV5IS
	tRRyo2plx2EbWzb8Ptgb4wgQX8d0jQPqxFj2iZPIGePlY+KUnLtjoJ3FCrVryuHO0D3tmMgcNoR
	Z8f5j+XyhTwAoQfR4Cze1XKfjqf7b5b1iUjdVBOyFF2JJuRWz/QD2RMdvTgo97F34GQRGxE2ORM
	hHBmb+KkQ0wcQrlUJ
X-Google-Smtp-Source: AGHT+IHycoCoJVtt7eLBZ5+vov4fPQxkaAKP2taxHWvQsxcB8inTLrOdpSWX8yxl7Zgh31ey59uNrw==
X-Received: by 2002:a17:90b:3c83:b0:332:250e:eec8 with SMTP id 98e67ed59e1d1-3342a26a9f6mr10387874a91.15.1758905945085;
        Fri, 26 Sep 2025 09:59:05 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a3cea96sm3023020a91.2.2025.09.26.09.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 09:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) undefined reference to
 `pm_hibernation_mode_is_suspend' in vmlinux...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 26 Sep 2025 16:59:03 -0000
Message-ID: <175890594293.1628.17920768087361832744@1dfac204f25d>





Hello,

New build issue found on next/master:

---
 undefined reference to `pm_hibernation_mode_is_suspend' in vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) [logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/i/maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  262858079afde6d367ce3db183c74d8a43a0e83f
- tags: next-20250926


Log excerpt:
=====================================================
  LD      .tmp_vmlinux1
ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function `amdgpu_pmops_thaw':
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2677: undefined reference to `pm_hibernation_mode_is_suspend'

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d6bd56aabea828fddae00b

## cros://chromeos-6.6/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d6bd59aabea828fddae00e


#kernelci issue maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

