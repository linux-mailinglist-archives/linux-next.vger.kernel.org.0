Return-Path: <linux-next+bounces-2264-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 860298C201F
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 10:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27D611F222EB
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 08:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B14815FA87;
	Fri, 10 May 2024 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WtY9iHl0"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802F85256
	for <linux-next@vger.kernel.org>; Fri, 10 May 2024 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715331394; cv=none; b=WIrinkaI4l3v3Wi5XQuejLX5Ci6dro1ZOZ302brc3PLQQQ3aByJCt6ZE/S4RhqcNIncX3T4YMVqw3zcggUIIo+f6Z6Yq2OS1HDCFPKJIloaarZ5PsezafEMw5volpWNOJusX27HIMmqWqe8hhFLb5+sXbCZwGxXrKf2XmT5q//w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715331394; c=relaxed/simple;
	bh=izZhTAs24+RZPRwsuYPyAh/Q5x2bwkt7e9K6VD1gvss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATKeB5bd1qQbkrviAph2wRB4CUpW43tFzUwGa1LqbkbXPw82ns1LGoILwBjoYDUN/BuGb22tZ5Srln8LnD4OR1X8R+G/GcBAJ0xkypA4h8xz3xrp196mVNJRHPLtR8gfz+SE52wDz2LdL1QffUVIIN7M7QIJVVcmVOgR/RjqRXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WtY9iHl0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715331391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/1HtW1diUXyOoT1UpVHQ9HQK9UPwOclrTertb9H4QQ=;
	b=WtY9iHl0h9x16F8zcOlhb0K3ZA+5T4DIfmKBZv4NbOUXftRtzMl0vKYf4JWkNO+itzERak
	gWdlYHnQYBDjqf+GQ/KUYosdSteYOCQTG5cB04JX+UEAZd4WuZNOOHMg7UUynL9+qUJphX
	Idenh/+pe0/DR9MEbBAtAqNGvLY5McM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-lkgnQVx_ON26beroS-0qLw-1; Fri, 10 May 2024 04:56:30 -0400
X-MC-Unique: lkgnQVx_ON26beroS-0qLw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-69b6fe789e9so16043126d6.0
        for <linux-next@vger.kernel.org>; Fri, 10 May 2024 01:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715331388; x=1715936188;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/1HtW1diUXyOoT1UpVHQ9HQK9UPwOclrTertb9H4QQ=;
        b=Klh1+5DCKKaGx4P0Xo4l96BBl9m2e1RsblhzKqCtBi91JImh2lIBCIfNcI2wwUTU9W
         PfPuhYeH2VaxTAUaykineA0PnlydQSSf7Wr5kc3MRgHIcTT4RR85EJUL989PMfTZ6yhg
         889S5QS/U5Jt865zo0vSYo2thLx6kcDyVdS1ndIe4uH1Yyi4Mqz7QOvirAYvHDbKdkwP
         O595Qgx+l4cN6a17nwBbzLhtWADxyVjEiQrPOuexl9OEMHE4+ADYKTylTzTFzVM43Je3
         ro6nfD+gxW9pmUQF2jUoAIoWeathIOK3v08c4eov0n0JGiS2/7IWExyKKsgvqRqlzA7W
         52Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUyOOc4aK/kPqliYspIzoJRKnGnR2QOKTjtWpUgAigNW4yAidSyaN6uBDABDGGZN6IVrOPxRfQ68dF5TZnJfVtFvseiiX8jOhTdeA==
X-Gm-Message-State: AOJu0YxNHrCaxnTBv5qtM+YHXLjy0QvQPlvLSJ/R7LKEP2Foxn3R0shY
	jpFie/9oVnZj3zNL//iA1vuD3CuJ++VNGXnIka0rS6CvpK+0+tesynBacm2r86nHoyzrzhXeZu/
	IwYnGuOFm4ISobAJNWfNk1XvwbKG3hFuzLqxLGbAQE++AHk4z7EdPlLYOmg8=
X-Received: by 2002:a05:6214:1150:b0:6a0:af07:1141 with SMTP id 6a1803df08f44-6a1683ab841mr13155996d6.65.1715331388466;
        Fri, 10 May 2024 01:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5P++0rvu3ocHs00JXzkLOeTOkX35WNC4wcph6t+zaDEiJDoZ6O0MnzdTrK8D+63uj/2cnZw==
X-Received: by 2002:a05:6214:1150:b0:6a0:af07:1141 with SMTP id 6a1803df08f44-6a1683ab841mr13155956d6.65.1715331388142;
        Fri, 10 May 2024 01:56:28 -0700 (PDT)
Received: from ?IPV6:2001:1620:4baa:0:3ee1:a1ff:fe52:711b? ([2001:1620:4baa:0:3ee1:a1ff:fe52:711b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f18520dsm15512416d6.44.2024.05.10.01.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 01:56:27 -0700 (PDT)
Message-ID: <2b3ea2b9-1959-40ff-b8f9-5ad1569f72be@redhat.com>
Date: Fri, 10 May 2024 10:56:25 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the amdgpu tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240509082313.1249dabf@canb.auug.org.au>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>
Content-Language: en-CA
In-Reply-To: <20240509082313.1249dabf@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-05-09 00:23, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    27557a840463 ("drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible")
> 
> Fixes tag
> 
>    Fixes: a6ff969fe9 ("drm/amdgpu: fix visible VRAM handling during faults")
> 
> has these problem(s):
> 
>    - SHA1 should be at least 12 digits long
>      This can be fixed for the future by setting core.abbrev to 12 (or
>      more) or (for git v2.11 or later) just making sure it is not set
>      (or set to "auto").

It wouldn't have helped, since I pruned it manually from the full hash 
(from gitk). The intention was pruning to 12 as always, apparently I 
miscounted though. Oops.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer


