Return-Path: <linux-next+bounces-9147-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C953CC7B086
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 18:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AA4FA3505F2
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 17:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51E632471B;
	Fri, 21 Nov 2025 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="QAZyvICP"
X-Original-To: linux-next@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB61313E41A;
	Fri, 21 Nov 2025 17:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763745170; cv=none; b=mnZPiU/uUXf2E6vSzy9K/XbwKYfO3+gwUZT84nJVf5WyLTB7YeI4an1mW2TJvZ2eStqcY9Jl+I18LomMg9Mge3bGfro/dHkBaw5JmHDPIiWcPYof+wAany7beG3fK2H4P8/EqOrxzywu89+4bnU+iXLegu0kulz0axyE8L/og1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763745170; c=relaxed/simple;
	bh=93oLITuF6kJ0obVmMP0WpuIQm51xIN172ocZPTfDZyQ=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=tVBIXSZypd6lMQJ9+DtqXeMQGM+757EHxVFxaQbmIFSRcb2V7Ky+yocyK5PlcS+a0/uhmV2igiNzu5GHkl8loPp0eqP5DpXnVZSLVI3kR9t36+q/K2/+BQf4D/ndotuFoL3SPCT+Ol7g1M4v8pEsoJ813HVpj8BBQtZAOdsgfBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=QAZyvICP; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALCbilm2018168;
	Fri, 21 Nov 2025 17:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=9
	irh16NdVLsEFe58EakSkx3HxXA9qzwBjOI2bq60wnw=; b=QAZyvICPyrHL+iBpx
	iaJA5YB+nxLZKPLlexmKWXEo+SVgxhBL3Gbzrh5pwvTQkKznF+RPQNgsxBC4f2Kv
	QpBEVv1h6mXoIemRR+LnY6LXUfc1/KTWF8CCgCWZSaMK5Y4L03ecZa7CMmwrkFxx
	NisOlTJOrCCW38M9+XdRtxM8IreyvmFjqJ8Kyvh+68zkmlxmoSeqDH0smg8cM2WD
	/gK5T3dLl3MBsWv3kqTp/Ik65HXpbbDWGuDvj0igYMasXyFrmwS1u2zj9wb7zQe5
	cPp8GczEE95d4JlzZKwuRWbtMRzw3A/sTZh+4VJwglud1EDpHeLZiQBrPAj9UIlP
	Z4QQw==
Received: from hhmail02.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4ajemdrhxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 17:12:27 +0000 (GMT)
Received: from HHMAIL03.hh.imgtec.org (10.44.0.121) by HHMAIL02.hh.imgtec.org
 (10.100.10.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 21 Nov
 2025 17:12:26 +0000
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.140) by HHMAIL03.hh.imgtec.org (10.44.0.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 21 Nov 2025 17:12:25 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Matt Coster
	<matt.coster@imgtec.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
In-Reply-To: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
References: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
Subject: Re: [PATCH v2] drm/imagination: Document pvr_device.power member
Message-ID: <176374514527.8082.7413128799744861664.b4-ty@imgtec.com>
Date: Fri, 21 Nov 2025 17:12:25 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Q6LfIo2a c=1 sm=1 tr=0 ts=69209d7b cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=A05BHC2L4TQA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=FQz4N2SRXKIV2AokMrgA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 6YcffAvrQeXTbm1s2EOeE_rb6RcKcnSS
X-Proofpoint-ORIG-GUID: 6YcffAvrQeXTbm1s2EOeE_rb6RcKcnSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyOCBTYWx0ZWRfX3YPw5LpFQ43W
 MJ5EASAACXfiU5KE9oNowUrjL1ThSTnsHL5ptiUO7ogAhgP/BE/EgaP6z7OK+kAMwRi3Hn604Hc
 HaGF/JrEjjuFmh5yFO4HvKkOOsq+CgbXDysExi//DywHMqiVcWHOJvEmHnHLdttz5rzPqDSbBaq
 xWcxddDbJJ76JwrMRFxqXjOydBQA+HUnKkeyKuAr0OJ1AQzFby9t6wb75tBH60XdcE28OYZC487
 iqiR4WaZ34dHQO1C0H0ErBo7YTMVuEHCphKvR9cLZlGqkuqli36RqoHWwQccNFbR+KMKOWINyzt
 BBDk12ib9AcHn9B603/WTiOl0l6/llOhdHnMcIClsA22IKOXuZVFfjjJwMb7NZgnxVlOropP997
 Ns+jvKoeRzGXBnDoOrEgkdnksLRzQw==


On Fri, 21 Nov 2025 15:20:31 +0000, Matt Coster wrote:
> Automated testing caught this missing doc comment; add something suitable
> (and useful).
> 
> 

Applied, thanks!

[1/1] drm/imagination: Document pvr_device.power member
      commit: 83c53f1a2d6c4c8c19354b926367d0e82dcd6386

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>


