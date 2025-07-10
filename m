Return-Path: <linux-next+bounces-7463-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9377AB00DBA
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 23:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A427B1CA60ED
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 21:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FAD2FE312;
	Thu, 10 Jul 2025 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="J1PBSLEA"
X-Original-To: linux-next@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE5923506E;
	Thu, 10 Jul 2025 21:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752182878; cv=none; b=kpb8imo+1DZfyTqvsD/jwyZWYeMGcz9k9BENzvRn8NpKYL3WhvE5PXG7mUsznzVDum/OaTtDRZnxnkdVCVxnoBxuV7zARhBgVe/lsmmYDb/3RKL2joduMCglI2NSHN0xfVASp2LGMmoHRlU3+2kt07JPN66gTUIlO6g011VS5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752182878; c=relaxed/simple;
	bh=zW+mMBsrEE80hDslzHG84qcFdNEtsBNyQLY7x5jD1P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBPq6S8pHsZw6iMMc2WJO2VIIC81FpAFSZo7eJmTuOiBaNIt2wdvg7AMF4mzRPAgYUGRqmuZJOuJFeHfAAAr3LdE5t5aJWIOsIaQqTJMLeraNzNWyN7aQ8jjEKvtFa61/68WUC6es+LCrM+QRTT/r/bwR+z1S+/wZQCrdUGgRXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=J1PBSLEA; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gHxnev6c8WKquWK4NI89Q11xi1hHesrnV1e9QJqrv9I=; b=J1PBSLEAgeiAZBmCEkqHBT007S
	N1gVXEPFnLGsWB+vmHd+8O+7xqT5ifzhNXj9ZJe219uov/mTiG9Q3l/3O2eoQzhlawva0NqGuXZbn
	cqwhxCPiO763HNgvAK2USjkvBYbwSBgbd2Est7OVXoMJRkE4/9Gv6WoA7cT7kIfK4NxdJRBuxZ/lD
	rCcewf7ppPvIG2NjDIn6SGwKxqk1K+xEcgzS/kr0Scsj4a4g2QmYwLS22AptCVtLXHPZ8berWxN9n
	fGm77pVblt/1TvGV+5SqPxDQKgBDQIObsD5DIYeo7wanAg4gmgbpw+44CdoJWOfeyt5IMp7v+ye+d
	FeMQeYJw==;
Received: from [179.118.186.174] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uZyo1-00F6ld-1n; Thu, 10 Jul 2025 23:27:49 +0200
Message-ID: <08de556b-e63c-420e-8ab4-c03712be9709@igalia.com>
Date: Thu, 10 Jul 2025 18:27:45 -0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/doc: Fix title underline for "Task
 information"
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250704190724.1159416-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 04/07/2025 16:07, André Almeida escreveu:
> Fix the following warning:
> 
> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> 
> Task information
> --------------- [docutils]
> 

This series is now merged at drm-misc-next, thanks!

