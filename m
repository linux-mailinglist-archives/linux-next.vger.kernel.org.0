Return-Path: <linux-next+bounces-9135-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D298EC774E2
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 05:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7D7753540ED
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 04:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B0A274B34;
	Fri, 21 Nov 2025 04:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FI7tMI+o"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66796FC5
	for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 04:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763700728; cv=none; b=U81b4VsktL+Euh4HrZ+qK+lIMXmNXO9x6UVsNyTFF4/xgFLdEf6e80i9+IpAlD2mMxSoEIOvG3qZYeDeymnE58Ba05ebGpIJrhqQMSWdwOpaH9oLCBkN0NIC71eZV9u3OIIzWBftctdgODIpIhUVflWR51NmP2lgXKFdJlII3dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763700728; c=relaxed/simple;
	bh=VHTrJ+Im60JGkqGcvpyIM1i0KvKskQohX/Urr37JZyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXf6FlX1XXpPdyv3deMQ1dfrHMQRKvodBCcjUnPUg6W19CXgTw1e2RBFl+y87OHENIiWtYFvfsOdtxgiEFqIddCFi7toSM06gcewXAsnpswyGiMWjK1P61csWRNEehbQIJ1K/E5xknuxI/0lhN9EQ6FYFurfHoWBSbXvL/YDt3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FI7tMI+o; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-343dfb673a8so1599104a91.0
        for <linux-next@vger.kernel.org>; Thu, 20 Nov 2025 20:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763700726; x=1764305526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P54Tr73UakVS2Op5h7biQ/B9QpbgQ0qjLP4Ssgt+12Y=;
        b=FI7tMI+oJZrRDG+V7qDoXVoOgQQ0Br3xK3ONsBwq0OFSbw2akv0MP1U88cfjFIwzsG
         Zgca3Vvio4etG94W1rjoIEQGiI1gZFARFbq/PsrEXJe2QfMgY0neCie2vsMncoAmBCJ4
         sfpQWPZDHbmGjHDi1aR5pXvMu3RiIsvLDFIdKAdXjAePw1PTQLQWGpPwhC4wc5cP1B2r
         uppr6XVgVjsBD3CtdDeh1mI3AACstaLKfquwiA/0brB+duwxFORnWXqI9kFd31P6uZXg
         XYPfXdG4XZ3Bv8/waLWlGH1Rct0g6bYNer/X/c2AWMrYsI/sWoTeSCym90dpZkiF7ovH
         j+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763700726; x=1764305526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P54Tr73UakVS2Op5h7biQ/B9QpbgQ0qjLP4Ssgt+12Y=;
        b=euKP5w2I1NVk3CfdttFxfVgXUvRx3USqbCsC15vZov9Xhit8/pbGH5G+7YiyB0d2wI
         FvMuZCownMR6bZxZy3yhDVD+Hi6eojSTktajGWgT87BVh2S76PReAJBayXXT0Bt/cFE/
         +invxa+p0x4/StD3NAQ/cpXhfwbVZj7FmgmCemku5QJQEnxKPeU3BqiZCwUKJtKHYetm
         xCmWQnF4adTn+0wPutvRWu6rG4spjnMa+z6XmhkCwoGJRJBn33Qyx++vOSBZUBE/Ob+I
         dMKcp/RjqhvTsOBpyR8SH7FXxc9APm+sWvCQ0aHyMARWLQA/r7hv9iRQbODFnkIgAmJN
         0pRg==
X-Forwarded-Encrypted: i=1; AJvYcCXaGkfOsqHZPi1Cx6mo0gPkf009wBccXbgOS6AeSTjwJoNstJBNs1D8tNNjUTOsmaO9aJE1lUdYTKAo@vger.kernel.org
X-Gm-Message-State: AOJu0YyQlWemDrEwn7MySE/1429hKQcnIR7Pp87Z6EmavZ3FYGrP6PML
	sgE+HOQQfxfDpfcU6yvRnGi7PeLEH9cq6f6EzuggD/NIagaIEQGilfjaPkeG6UF7nZKL1KuhbW3
	4eklH
X-Gm-Gg: ASbGnct1R86AkF1rLR42KtAG1SsTNXmUD8ZwUv+tTwZM/dVrZk8oli8fP6eNoz1Sz9m
	GMBge1RWaPLwF8wYHV5eqjJTyrRZueQ66KROPsTC2r3+5y6dpzOwL0JdpUVAQxeJNIGS/sHt3m8
	j7CV7bI1YDUn+gq95HkGF3euGVFsckFhBJVDeHsfCSOoQ8pJqPGKI+gF2wL4XuvB3CpoF0VJOUw
	ocY7OFVoqWDnVwNWDASy/ESB6++J6YKVbGVE22X9Kej++WDWco28daxIUqSe3OS8FmTQkDSlRSi
	c8jj8aVkDQvJcfH/S6KnRDRewT6GRBREFqlg8x9axqYRULzpbMtxvozCjokidtdcc9cZ1cJlyPN
	z+jXzPT9Zq1tN8F+oHGLQsMbhAY3p9gGa8fBHBSR0Ga16zBgxARGG/BotYgPDgPcuf2WeCX0/4n
	Lsc/+0SXpvKis=
X-Google-Smtp-Source: AGHT+IGxq8EV8QHBh7IptOC31IcaKDmBjgBg6OldB5k5zA2HiC8Jsjswx+tFCLbIrucjV/cwAt66Gg==
X-Received: by 2002:a17:90b:5588:b0:341:8ac6:2244 with SMTP id 98e67ed59e1d1-34733e7677amr964564a91.9.1763700726108;
        Thu, 20 Nov 2025 20:52:06 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-347267a1240sm4174132a91.7.2025.11.20.20.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 20:52:05 -0800 (PST)
Date: Fri, 21 Nov 2025 10:22:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the cpufreq-arm tree
Message-ID: <xdi2mu2i5yu3a57g5cla5vyvpjbrazxuzdqpvc37lk7lnf4uuj@czcpd2eu3peq>
References: <20251121120405.50954add@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121120405.50954add@canb.auug.org.au>

On 21-11-25, 12:04, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the cpufreq-arm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: qcom_cpufreq_ipq8064_name_version+0x140 (section: .text) -> qcom_cpufreq_ipq806x_match_list (section: .init.rodata)
> WARNING: modpost: vmlinux: section mismatch in reference: qcom_cpufreq_ipq8064_name_version+0x144 (section: .text) -> qcom_cpufreq_ipq806x_match_list (section: .init.rodata)
> 
> Introduced by commit
> 
>   0194066ac1ca ("cpufreq: qcom-nvmem: fix compilation warning for qcom_cpufreq_ipq806x_match_list")

Fixed and pushed.

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 6c3c125f6818..81e16b5a0245 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -256,7 +256,7 @@ static int qcom_cpufreq_krait_name_version(struct device *cpu_dev,
        return ret;
 }

-static const struct of_device_id qcom_cpufreq_ipq806x_match_list[] __initconst __maybe_unused = {
+static const struct of_device_id qcom_cpufreq_ipq806x_match_list[] __maybe_unused = {
        { .compatible = "qcom,ipq8062", .data = (const void *)QCOM_ID_IPQ8062 },
        { .compatible = "qcom,ipq8064", .data = (const void *)QCOM_ID_IPQ8064 },
        { .compatible = "qcom,ipq8065", .data = (const void *)QCOM_ID_IPQ8065 },

-- 
viresh

