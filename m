Return-Path: <linux-next+bounces-2571-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E090BAC3
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 21:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360541C22D8E
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 19:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E071990B7;
	Mon, 17 Jun 2024 19:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IjTY0vEo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A93198E88
	for <linux-next@vger.kernel.org>; Mon, 17 Jun 2024 19:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718652088; cv=none; b=KuL4AqqXo925RxOESB1bbE1GZvxNA31/X7Mi5T3Crie+qhI8T7F0qoFoMXkEnDl4U4RXRiMYAx5JQyXMKU+D7CEDn33uIa/zRpIgkCt633yRhNkZNSBkQsOzDtzEXpBrqc+JFE0CKdFdhh194SFQXsFCCVEtTfZnMjBTYeMcAhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718652088; c=relaxed/simple;
	bh=aRUhmvylMTPbq3pdJ1I005LXAnQQi9aW4RrMkcI2JEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JY7S1Wf9k2woBSPlWh1x/7SikFIJEI2AcRcVs/eyu5ZjqZArJ/y9hKnpLz4hNFpUt+omNu/ArmwcugQMUlQM6n9ucfR4ZXvNsELsAXgXBkHcSNpfiw6w3uL6X3EaMTVSeIvwq3ZnXyvtgoMCDu2i+bm4B4K5+RhDMiyWH424kaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IjTY0vEo; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7eb8889a0baso21537639f.1
        for <linux-next@vger.kernel.org>; Mon, 17 Jun 2024 12:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718652086; x=1719256886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hnc9BmvHqZ1cO9VRkPww5l6SCS+m+GCA5Xpa62eIsmw=;
        b=IjTY0vEoCC9+fkQn0V2ZT2a+rqLyYkfA75sPJ9in1Y5uViwokEBQF+sAXbDnHZ8h1S
         +NMQYZTQ1xSTx+seoPViXCbfrwNKOzS4IwIF5BQGKGq+sAHebzL9nLkEF3yBpy5WEXYo
         2oSoFoqo1MeSNhUL7ATZ9ZcQQYr6TWebjuOLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718652086; x=1719256886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hnc9BmvHqZ1cO9VRkPww5l6SCS+m+GCA5Xpa62eIsmw=;
        b=I2oPpbwgUVlOc+i1YXG7OV8JKar0RmpwEqnyn/WgxOEXN6sNDQkCayQ2NAPqCOx3wz
         RUd249UTZDxGec9Zpxnw8J1Don5radd8F3yOIGeq6Py/pDa6QsMbTAcXUGg000cj40WW
         ngpFglDQlC+oQtrBJy+47XsVsBITkPPdoqYonzbKjdkALz+s2Q5Mnb8OXTECcE3JTlFj
         vV2MMylqC/5XV6GC2/6Q32l3szTSM4jPfLjY7jXI363NSYiJSfuL7nca7gwUvH/Thg3d
         nygByyZkOQc5/j5wl+H7kzXts2UJh19vXfddsh3ysCsX0PkPAxtPqVLTXN6GKNG3Ijqh
         eWfw==
X-Forwarded-Encrypted: i=1; AJvYcCX4kvBzkhFzClb2DYu/x7jF1p1fXDFy81pK+Dx+ECLivNHKZx1ThJq+oZ3tTInlI1ToXOMYs7JK+qMSNBMe1YWt1X9fL1bxRvO9yQ==
X-Gm-Message-State: AOJu0YzVm3e8gH8rg5wfKA754ixXcs8+jNNqpfb1eWHq3zZS0a8x3wJ8
	7D1Ri21MoY0i3PeQ2oGp7NMa1Gz4+TkTBDOqRLQORkwScKm6PdGrl9tgAbQz50w=
X-Google-Smtp-Source: AGHT+IEJNYqO2H4hy+J+bElCMNOnzT6uvzuzSkCtBsp6G3WPl5E0ldk+xvk3pq7azhpQfHCk+09VOQ==
X-Received: by 2002:a5d:83c3:0:b0:7eb:69ec:43f2 with SMTP id ca18e2360f4ac-7ebeb524819mr1040417839f.1.1718652086007;
        Mon, 17 Jun 2024 12:21:26 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9569169bfsm2846018173.45.2024.06.17.12.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 12:21:25 -0700 (PDT)
Message-ID: <46645216-dcb7-45d6-83c5-fdd9451362ff@linuxfoundation.org>
Date: Mon, 17 Jun 2024 13:21:25 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the kunit-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Brendan Higgins <brendanhiggins@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240611152225.7264e9df@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240611152225.7264e9df@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 6/10/24 23:22, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the mm tree as a different commit (but
> the same patch):
> 
>    425ae3ab5a1f ("list: test: add the missing MODULE_DESCRIPTION() macro")
> > This is commit
> 
>    245e5db4adaf ("lib/list_test: add the missing MODULE_DESCRIPTION() macro")
> 
> in the mm-nonmm-unstable branch of the mm tree.
> 

Can you drop the patch from mm tree? It will help avoid merge conflicts
in case there are other KUnit patches that depend on this end up in
kunit-next.

thanks,
-- Shuah

