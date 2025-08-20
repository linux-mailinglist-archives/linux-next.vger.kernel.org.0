Return-Path: <linux-next+bounces-8038-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC21B2E512
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 20:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0256CA239C0
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 18:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7B32737E3;
	Wed, 20 Aug 2025 18:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8qfrWks"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77F125C6EC;
	Wed, 20 Aug 2025 18:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755714917; cv=none; b=Kkz4S/Er5SOWtgR2A+1IXb2MjOW8uQ1Vfs7u+ldijL58OSma4HgegKvemYC4d4MktdQ+wJx90Y+Bzle7gkXjagquR8sNRK7MTZ8T6BMCOEnoF3RBzmjPtWYN+I+SPzZaKkXlgFj7S4GPpqr9TCshEgZ68sgbK8th9A2e4lFvtg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755714917; c=relaxed/simple;
	bh=KJC6NTMgquCaQbQFW8etgW9/vLJM2PHRl8K5RFupq4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DChrkJyIKka00EqWvwkCHjsVCyJ0qcRiMQAxk6ilARnS0qC0MMbDB+eNHeEVXUjA0pakAmkp7AmZ6/o8pZcNh0kEvQ7MoOCYydkexY134KVOECQtV1yVzl4wVV5duvn9iuTqj+jTIIYNhGf7WUpEG9rqA1tR5/JO9bRCyUoZZ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8qfrWks; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e2ebe86ecso333981b3a.3;
        Wed, 20 Aug 2025 11:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755714915; x=1756319715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbccaaOrg7oxw/duvj7P0mjLZUiDBUvzDNDOakXvN4k=;
        b=D8qfrWksfIwZFFQFQZxvwpNc3504/UKLxXrKzL3SY7gtW8xWbGV54y+Xc5P6F/Lwwo
         Vg1tbO4ct8f+jEmM0QhwBCuQn5fIUB16phFfUW7x34K3ihyc/GQkvUs/BjzSZ3v8mNIu
         nbany+KU+TRxtNCnvH3tLzqikWp+isU6dH+cx1Jf8m1LttMd8N7dDlJW+pTUYZ4MuVQc
         plD/eOtnW3UKmxTIyjSYjIEfbEGg03FX7mRtdelv3riT39tkjpGAaaV8DnoKAVYjimKC
         3VkcPyjhm7oCw/pHkbXLYFfr1Z/UE7Y3grUOU61dvMVnl7JCgWoISWJ5l6k3JPW5ue3f
         Zj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755714915; x=1756319715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbccaaOrg7oxw/duvj7P0mjLZUiDBUvzDNDOakXvN4k=;
        b=VEzIx6cWk8zdHbYqIFVRytYtjRKQNL12bO9AZFz5Zd27SFrTsI/qYBpAs8mboEDtvV
         aGbrdRfXvakak1S9OH/HgG/3+MN8BKUY2Lpgro+aOe3ZPBPdx5HG3mghLrD2daalvE5S
         HZpsE9snbbP6gzj/28YpxC/MCiLc8heeZFF1WAV3ck5ie5jiFD0hUlkWNKi8xHkyfn13
         jRgPgQmMkkBZpO7Bpx7hWoXlHCUlMMzK2r4/iiVeOb50ukph5enNHzfhGjJeo1oKwZgB
         htBAAYivZTlnfIhwK/eH4RLZhXLwRRP4wLusY/nQ8BvSzJCVWjGddgXDNIvS+Ffbxckg
         9cLA==
X-Forwarded-Encrypted: i=1; AJvYcCUMQsjSEZdGg/ugKN5Q8vedNw6QKutFZZU9yaLMlPWs3jr6Z9sLkFGTrKMFPQ7kU7dbPwBu3PJNDk6kNe8=@vger.kernel.org, AJvYcCWC4aReDEtqImqifCzv4EBe8Omu0VlIP4LGLQicC/YHqiOOJL4p5bXxMpLvwLJNZPkqNuXkjP8bGtpf6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CRD0oEwToNxmqW6szlQnsxGuR1+aM9V4mBIqvRGvV0PyV7Il
	U4aQ5mDv+ACHIe26xiG+Bp3F2kKiJXc8qEmZY5Cm4hJ6kRVmqkdKOc+j
X-Gm-Gg: ASbGncsgoBrc6PBEPt6I29fkQNPAiDEvksGGX1MLR0y80BoxqQxiQ3pNRtv5IinCHvl
	ETP12IR/LoRtZFsa/NmhuJRmuOoJsP89fCial6QyK55gdVf+/tHXuQ/QqNFBU3Dxe/B8Ipef0s1
	aD5F8i7YnnuBaNSMcpUTRDNtoeiWymDav8ewxT9+9R9zHMl4LU/lyXJfolPdVNAFbA+cCWCoWnC
	E2OPS5YixRSSpNR+jfEB5ds+QuMiC+tx2Gaz0asdKmkyk5KsQ4laZlksheVGf3vxM7+uvghOahI
	RYcAVl661D+pkU2xLHbIxOLZlaYD0YG754hzIOdCX/FcBaoK31Db6jaa9iaeWxbDfMiffO01Uk/
	ygnmazyvClh73n2X5mNmkSZLYwleGKGepCw==
X-Google-Smtp-Source: AGHT+IFeFM27GRtupFDaHDrUEu5suTdscDY+yaEhRj/AfNxMn4BTjhM/K7Lr8qgDcWB09OwaZG9Aeg==
X-Received: by 2002:a05:6a00:2304:b0:76e:885a:c3e7 with SMTP id d2e1a72fcca58-76e8dd6c022mr4913681b3a.27.1755714914847;
        Wed, 20 Aug 2025 11:35:14 -0700 (PDT)
Received: from server.. ([103.250.145.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7f4a6e60sm5738583b3a.110.2025.08.20.11.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 11:35:13 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: bagasdotme@gmail.com
Cc: dakr@kernel.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	rampxxxx@gmail.com,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	seanpaul@chromium.org,
	sfr@canb.auug.org.au,
	simona.vetter@ffwll.ch
Subject: Re: linux-next: build warnings after merge of the drm-misc-fixes tree
Date: Thu, 21 Aug 2025 00:05:07 +0530
Message-ID: <20250820183507.84200-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aKLAc27XGAadB8n5@archie.me>
References: <aKLAc27XGAadB8n5@archie.me>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Those htmldocs warnings come from missing Sphinx markup in 
`drm_gpuvm_sm_map_exec_lock()`.

This is already addressed by my patch:

[PATCH] drm/gpuvm: Fix kernel-doc formatting and typo in
drm_gpuvm_sm_map_exec_lock

Link: https://lore.kernel.org/lkml/20250803092622.27532-1-reddybalavignesh9979@gmail.com/

The patch inserts the required directive and corrects the return-value typo.
I have verified this.

Could anyone please pick this up or keep it queued, so 
warnings disappear from -next.

Thanks!
Bala Vignesh

