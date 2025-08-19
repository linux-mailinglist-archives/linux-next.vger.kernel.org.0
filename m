Return-Path: <linux-next+bounces-7990-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41422B2B5A1
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 02:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB557626611
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 00:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0694188734;
	Tue, 19 Aug 2025 00:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjiAxZ4Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C4E3451D0;
	Tue, 19 Aug 2025 00:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755565174; cv=none; b=Dr1Ig/stpnERCZxKkmLW6gETtyYRzVVxyKw2wEJJiE230e4nHoxCrg89L6o4ngS0MLIbZME9Mf2QVF0unNmx2nOoAjqD5OJcjLFvh67ctGkEHS21xYe0LO91MbVQWtl0DUpBG/sxXnvw0InLPfLsrXAoksLMQNVevUU1DQc6wOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755565174; c=relaxed/simple;
	bh=c/LV6noORB0D4Md1eWRVuiELmQhn6kk9mea6ppRZJmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gp0TsQS9E58zDVNT3TCFV5PrQkpmUT4rqQ5mwM/ihZB/Tkywe8piwTprbFegfBFH9M5iriS/VcMWURvYLGGO3b3SwBQPRTercI5YorSvMH3aGiJ+QGcOg4J+yNXlsMu2eF+4FpQVAXiJOW1zBWrA6FWtBLuNNzoRwjj6UX0ugr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjiAxZ4Q; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-30cce908e12so3771455fac.1;
        Mon, 18 Aug 2025 17:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755565172; x=1756169972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KN4G0efAeREUbgmBD71EDAUq17QjYOcLNOKyuUkZomk=;
        b=TjiAxZ4QSkYw7saqjektxlQ0Ld83xnl4GeFLj9bE0MQ80tVvJgW3TPMjvbfG4EC1N5
         K/HMstzwn8T/n/Yq3b6zJdcFkzHrV1EOwL1vyW4GYWmukJ9K02O9Oc2diRWSQRrAgE73
         DzCUdlJHg/hXGZBmzRm+71Y4FSyein7ELVD25YRSp6cYj8q4AFIM5uU4xG8goByGovF7
         jpwvYBZp3I9rnoQOik1D/M7oVjwerkBGveNnZ4+B05K9gFUzJnRdawaAZkWAvwGqGTrQ
         3yMKuIIbSADrn7BMGKTEYO87LoS7kBvGV2PCWlj4TpWVI1O+QYuTugVxFLGglzAWdsIb
         L6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755565172; x=1756169972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KN4G0efAeREUbgmBD71EDAUq17QjYOcLNOKyuUkZomk=;
        b=kncYTp969NNB7Crtd9dghuA/qq+HQMVC4OzhLAW7W7UMZzgA+759lZdxqoY8w+CHrL
         IWhDI5jD74RofiaVNBkOlVE6OLxoLd8D91VFY6+eMC9tbKkjFWiDqT0h+8etuqHQaVrl
         Nsa6QUP3oip2RzPZviJJ9u6r8srlQOLm3Pu9w1AZSu/C7F7BZ0F46kdMC3kK8hUKPQxK
         sJyFpCIxhw8miFNl3v6e3abLbECAbXuvc12J5IMf2OQP2RA+zLBgEx6PyT8z5TAvOCG4
         HVOfdPenzJBKPCPIi3/YOVQmaRp3p78By2psjPtUF92QDu3l40JXoY5Viw4UWSGXSGkB
         0nVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfeLO30TuSRzP23yhGWGKy5j45yzXati3dDyNs17YXDDeWeJzRPsvn8RdoBo6ciiz/GOMc60XsmicUs2U=@vger.kernel.org, AJvYcCWD5w/c2vRbxzzd610m+uyggFHpM52C89Z6HhWtIZokignRQrnkS8Wiy32v1yfmomeMJkJBks2hcCidcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuums57bFbnM2sY96bdCv+VFiTt/WxAVuBAqB7J1UfAowfqOMS
	fQQcHNPxWpyd6CHUEY91FOaWjZNBm5q1AM0gf/RHDJutXacvwRD+OXGvaDzp6wAeRsv9X2B3EdV
	cThJVMmhLwaP67vehnrJnlmssJSoWydm7KnVkGfI=
X-Gm-Gg: ASbGnct0ByrlDhMk/wd/E97rE4wsr2Hh3E/BgEC1PHMoED4F2x4KDnkdcMtPAW3RlEK
	PG4e3SXDJJzSkYgnOyxYo5OeoSuAZN3XeIhAF7dO5AKMM+Dk4eZu/wop6WFZ5K8WkZv1MARNQC0
	wxXsfmk0zX3Iovvxf+b0gjsXLF7wOje5Q40LPYvGUFJ6F6YOemhcYF7QdUqPe0mvK5wejnJfZ4d
	BzQ
X-Google-Smtp-Source: AGHT+IGhPkuM0TXmeygd9dHMKoeZWTn4iUAid26HIVKmVzpEq10sP58J1WO7ncm/ah6zHg4yWJAjqR+q59sN/fzCaW8=
X-Received: by 2002:a05:6870:cc81:b0:310:b613:5fd5 with SMTP id
 586e51a60fabf-3110c150890mr717921fac.10.1755565171753; Mon, 18 Aug 2025
 17:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819072328.509608a3@canb.auug.org.au>
In-Reply-To: <20250819072328.509608a3@canb.auug.org.au>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 19 Aug 2025 09:59:20 +0900
X-Gm-Features: Ac12FXzq-f6sXHurGUd-fbqj9GS6KTV9ARYEAaSkO9z0AHsk_0R8LrOU5Kmm_6I
Message-ID: <CABFDxMHSkmH3LLmZYZN6-Ymj+yRNoaA3=9zg=4P7ZrOxrBs8bg@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the mm-unstable tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Stephen

On Tue, Aug 19, 2025 at 6:24=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> In commit
>
>   1ce24beaff3f ("selftests/damon: change wrong json.dump usage to json.du=
mps")
>
> Fixes tag
>
>   Fixes: 441f487d6ebf ("selftests/damon: test no-op commit broke DAMON st=
atus")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: a0b60d083fb6 ("selftests/damon: test no-op commit broke DAMON stat=
us")

You're right. I think it might be changed at the point rc1 -> rc2 on
the mm tree.
Is there anything I can do? Or maybe Andrew can help?

I didn't mean to bother you guys.  Also, original patch is from here [1]

[1] https://lore.kernel.org/all/20250816014033.190451-1-ekffu200098@gmail.c=
om/

> --
> Cheers,
> Stephen Rothwell

Best Regards
Sang-Heon Jeon

