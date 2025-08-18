Return-Path: <linux-next+bounces-7975-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E79BB29C0F
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 10:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C54683B7A7D
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 08:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660672F1FFD;
	Mon, 18 Aug 2025 08:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpHYspAz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3492E25F7A5;
	Mon, 18 Aug 2025 08:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505446; cv=none; b=fS/bX4P4Zdb3duPJAyfsrgUv3wrT4LFv0HLzRa52u5uOV5Xy3MO4LAbBGQ3qD3STmKiGqCsMNLv9J6E54x3GfITtY0T+yv48lUiKGh+drHeOfJzwikZZoibznys26S6pG1tGXvIdkUuPohVZJYFV33cbJ9ioJVJ4lu2OmpiBo+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505446; c=relaxed/simple;
	bh=oHe8L6AJ1HN36OrIi1UFNdMX8VNWXSRddHimq5CZjsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fi3flfA6bXmG9yel54ITgpCJiF8sv424nKNpLt35iJyYtkppPOaXEe1rn/D62G9UNesRRcyMeJy6AqVS6g/9oeDuYo7sQfVu7FVhdrvsN4f/9KigAm+rWvwHRjO8nS7tS3R9Kf+bbDIA+KhJdYBqbP1OFmK7bdCJC0IW521wEWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpHYspAz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D0CC4CEEB;
	Mon, 18 Aug 2025 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755505446;
	bh=oHe8L6AJ1HN36OrIi1UFNdMX8VNWXSRddHimq5CZjsQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MpHYspAzfcqUFGH9LU2mLKVPXtjQbW+njzf0JVMQ+IFJrXikO/Jkn8jcUWtD7SZjT
	 xy1d4rUPAvp/ahldzFLNaLepm0HHfpgp+S01zniBRz9sxgnsX8KF4M8lelArs9G70n
	 OcqZ8sEoJy0psmJbYv1vOvVzR7Vf/oKhXvrQrbrpkTsIkPfj/NQGAKS2HCukxYeoxk
	 bibNys36behl8ImQvodAXJ3fbwL8MJWlJoKyxYd3UGaS2G++aJb1ZhatS4TO7HsnJ0
	 ivrgiCPtKTEs9pfHj4X9DZQna25troV18QONGEBbYUkDBKZR73lbWy2N7Oc9bBW5NF
	 cFGWCEMRBXKcg==
Message-ID: <cce242b2-dd21-446f-80f9-7f501aa15725@kernel.org>
Date: Mon, 18 Aug 2025 10:24:02 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the drm-misc-fixes tree
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Simona Vetter <simona.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Javier Garcia <rampxxxx@gmail.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250818123853.51aa3bc4@canb.auug.org.au>
 <aKLAc27XGAadB8n5@archie.me>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aKLAc27XGAadB8n5@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/25 7:56 AM, Bagas Sanjaya wrote:
> Danilo, can you please drop my commit (and kept Javier's one)?

I think yours is in drm-msm-fixes, which I don't maintain.

@Rob: Can you drop it please?

