Return-Path: <linux-next+bounces-6584-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 452EEAAEF48
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 01:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 603441C001A2
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 23:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1375290DAF;
	Wed,  7 May 2025 23:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="kt1Z7T47"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09D020D519
	for <linux-next@vger.kernel.org>; Wed,  7 May 2025 23:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746660382; cv=none; b=X/NwwSrA/QLH0rtZgxwDA4QBRcnzlVQ2k7R16uuLgE7vvoOvU0mPXF63IRs/YVExwP0Qr/emECZmgm+q3ajC0NX9ytHOHE983UM0kGl2k8QN7iwIoCD+zHYCwZ3K73Jv5DKGsgHthRXgQhhscTEtwDcbxJqOvgbZLN21IKmrfHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746660382; c=relaxed/simple;
	bh=lu3w6P7LlMUwY8Cp9KmGVgkdFrtFQoSpFx8q4kwWKss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNn+3Sh5d36NdZc9oRhypXVKatlp3kdnQbccN4V7O8LcYBb6/Tlhvxk1vgr0zqcH28vJdBTLpljKaHPw9fJmsYu+pq6oxPdEVFFRLdLGeXeYVKzkcFPGe1Z8jvGsuzFgDlxZgyISGwzMZwWmbW9w3esu5HqMZmJqyxRv8riRL64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=kt1Z7T47; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e661313a3so4813595ad.3
        for <linux-next@vger.kernel.org>; Wed, 07 May 2025 16:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746660379; x=1747265179; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lu3w6P7LlMUwY8Cp9KmGVgkdFrtFQoSpFx8q4kwWKss=;
        b=kt1Z7T47tzva4qrQ3ZD1rF7ef0VsC6HSHTDjFeVG7joa02f9VZE6pHWUHcQGQTYmKY
         trH6LZi1hJsvVxNertXpAOcA2AeFV6hN0rq4qD7uIYbdOeQPMkKnviv5MN/L5AsWVbtl
         NdS/Pv1sm0e3fmLDKQ+jeMM/ZjX8NtbaNKrTZdZ98advuDb2nWTmXeksl5rFre1+M7Pr
         adwSEFY6ZXzwP9gNbyaAJJo/8dEn03gC0+Cxo4FzMGs+y/fUPdr0EfTSBI5P52e9Bp/L
         zMSS5kqonY0DEPD7KT8Dp+9VJccMEdtILkgBaSjpVXjl0EjBGdsJ7oi9AIx1cxnzRVnd
         PSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746660379; x=1747265179;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lu3w6P7LlMUwY8Cp9KmGVgkdFrtFQoSpFx8q4kwWKss=;
        b=CQaAyK/CBpZgkkV305BX570vsE7c0YnJVUmx6458hgllkik/2VcWCuRrLB4VutEmbk
         pTtjGLpr3VDkAt+PUvIBebSNGzXexiH0D60RxN7DhriYTI3o8n1igcQCluz5DINPRt9Q
         q8D6vXuGbOzPoi4xblYv+4jrrGVvUS7sqNnbuBMkt8b9fek8G9yQzSPn9JyZkwvM/vwG
         htm7DycqQ7C2WGZR8FtyxoR0ioq7AEHN4Y5O1TC8RpOt2xDnB4qwUxACRY0BTWDR1kk0
         uTmJIjd1fPUwV20RlhH4P2UHvjt7Aixo2EXGmfDNjtzLHF4b11wd8sXCEC/0ZytVJFlx
         2CKg==
X-Gm-Message-State: AOJu0YzWZqf33Yo/uFzib/tXL5EuZC9YIZQhBaA29CsvD4yzFQ8MfL3J
	f1LJ4u5ZCEmyfNByjV6XHSo9VK05l0ZMJHF9SUfNzaAvEiOtFAKYCDxmReUQvBGKjWlaUVsOEsl
	P
X-Gm-Gg: ASbGncue7iF5yAyN9rNm7scDDjX1imzzqtzOcmlIQl/STNVQod+cj/8zDemdqbi93iy
	LDO653aBcMQ0K8meZURGpEWcKzat3pkyqTAAw88WldlUhYxFjXpylKVWY7CY9CraLRC00zgPi4m
	BUBTtXHx6gTC4ojHBr0yb/KP4bnKP7AmGw3//P8sZKwsd+lJ5yFsBdNeLKyPKT21/Bs9mtMJXOc
	IVoEsM0cQoi11WLtv18GU+jsKM9x6YSwWiP05eeno3ixExxUINXWq8noSwXEosd0UG91DE5BVdC
	XiOkbuBSPaYghuAW+zqWnfCb8fozgS+awwBRJyua1FsZrrE=
X-Google-Smtp-Source: AGHT+IHBySKvQQUBREV+QQ4TmMCy8WuFlBBAxGTY/ZaA+bqm+UZuBvxYqnEB+yBdmDHfcCPOAdt3DA==
X-Received: by 2002:a17:903:478d:b0:220:e924:99dd with SMTP id d9443c01a7336-22e5ecc52a4mr84664645ad.34.1746660379040;
        Wed, 07 May 2025 16:26:19 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e5d633ccesm26112615ad.228.2025.05.07.16.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:26:18 -0700 (PDT)
Date: Wed, 7 May 2025 16:26:17 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: Add thead clk tree to linux-next
Message-ID: <aBvsGRZqbz11HPwM@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

I'm the maintainer of T-Head SoCs like the TH1520 and I've just created
new branches for T-Head clk patches. Please add these to linux-next:

thead-clk-fixes git https://github.com/pdp7/linux.git#thead-clk-fixes
thead-clk for-next git https://github.com/pdp7/linux.git#thead-clk-for-next

Thanks,
Drew

