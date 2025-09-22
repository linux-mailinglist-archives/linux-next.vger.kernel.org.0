Return-Path: <linux-next+bounces-8439-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ACBB932E1
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 22:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3275B3A5158
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 20:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B302877DC;
	Mon, 22 Sep 2025 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XZyJq7ib"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34863262D14
	for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758571655; cv=none; b=q3djwl7nnl7uYHVXQO2v5MWrQhMQIvY42h7jCrKm6+KpYK6kBsn+uUOqsl0tom5n+N1P6BKiVaa4hVLPS+J9EU0lEUeabI+3jnUMyM8a1Djceefevn2y+sh3qwxeobyzTcuqHFKRrvGSHWm2w9eiT19gA1muB08TnTptN0oA+Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758571655; c=relaxed/simple;
	bh=6CJ0KW+URdkmZ4tbUupKMPCVo7ZeoipGa73suWsFWQc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dL8w+o2rRCuceVBY9AmmCUX0i0zA3INREWmkMWb9zxa4yRp94oa0Lm7knF/xKSsmI7CneEy3SUdayxhTZMTeD9QpaeuBa0rmDn/FEu+n3eZoxmBbpIZsBidMf1wHftZN637ajcsgNRvt9jOhdlwXaQ6M0sm+XlbbBmLgKe4ZU48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XZyJq7ib; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32edda89a37so4697286a91.1
        for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758571653; x=1759176453; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHVlPkCOtSU9tCydWDCBogIvQyeTN6Akzfyqfejfm9k=;
        b=XZyJq7ibB5TY5V4Z7ROurhfMTYeuFpJYhmiq4o4fW7NXJbFMBTQfZ8Xl3i5wW95EEA
         bJZ412H4D15UCHKx/l0X9UoF9bjfkSacbyhSPsSMsHC5gv/GwXHCS3U7dXouU+8znmNP
         aqp00DPJ9CPEhu/QKiHZSkm3KILJZ5WZWUvnKVerHVVV35tr/S5rm9ypQz580UT9pWpm
         9gOq+INxyN1IUpi6EgZZMy1zs4J71/DZJ0zhogiQJMF7gVFRQ0WuPYK/6na+WghpUtb8
         AZg1aCyEPNyAWaauUHJpB/O7a5yBy6o7WLe61xWV2cy4eNbdncOF+G+gIvL/CAdL/+Xi
         Cgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758571653; x=1759176453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHVlPkCOtSU9tCydWDCBogIvQyeTN6Akzfyqfejfm9k=;
        b=dxt35osmsRwj+zOxGHzw/x0IGMT5WtUIQ6lHGU1y0Ui3ZStRGqQVZcPZmyOD3PQWYs
         /+SYqNJFQrVH1c7XKn4XyZoQ1dd1IK2p1SXEEZugr0qUOiRQZG0/XiPOvDq1VxjtrTZI
         nn4PX6I3zkzSeEUEIdVUlPS6R95/tOn1ALP1bmjrDIvGhKZ+8a5hv4i3KMThOBl92j58
         3l6NZIixWBstwbOTHmDI2c8r4g9EsChEzE2Vh/5TVk6ZzHx8CbQN08JOLbhHDi3YNiuY
         pTTvBU0/eootX5jzAJFRa/BzX8HAOpgOc1fsgguTsxmU6sCwTU0+EwHkU+B6KhbpcQ78
         BUyQ==
X-Gm-Message-State: AOJu0YxGv4WGLO1S+EV3wtJvIXg5FdNB4Y1+FH2RUa7+WhpTQ+H4U1ZN
	GYuLmhwy8BJpI/lXFbL/TMkaHcF+q07i/qNXhk2mrpYNE0W6TphxSn1Tcv91PQNbN+KtnEmwvlz
	+JFSG2Q==
X-Google-Smtp-Source: AGHT+IEevXE9o78fuO0/crt3HHrVCmEh47ekFy5CDVPAuhy3CP48BtOQrer0a5WEReLcDwzVrt4rdfvV5pM=
X-Received: from pjbsq6.prod.google.com ([2002:a17:90b:5306:b0:330:523b:2b23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1cc8:b0:32e:ca03:3ba
 with SMTP id 98e67ed59e1d1-332a95bb8b8mr168219a91.22.1758571653521; Mon, 22
 Sep 2025 13:07:33 -0700 (PDT)
Date: Mon, 22 Sep 2025 13:07:31 -0700
In-Reply-To: <aNEEPyEdykM0QoSX@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aNEEPyEdykM0QoSX@finisterre.sirena.org.uk>
Message-ID: <aNGsgwlNEegmoHQw@google.com>
Subject: Re: Fixes issue in the kvm-x86 tree
From: Sean Christopherson <seanjc@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 22, 2025, Mark Brown wrote:
> In commit
> 
>   eab8d9779f5f7 ("KVM: x86: Move kvm_intr_is_single_vcpu() to lapic.c")
> 
> Fixes tag
> 
>   Fixes: 2f5fb6b965b3 ("KVM: x86: Dedup AVIC vs. PI code for identifying target vCPU")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist

Gah, I managed to pull the SHA1 from an old commit I ended up rebasing.

Now fixed, thanks for the heads up!

