Return-Path: <linux-next+bounces-9450-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD2CC9985
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 22:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01F12303789F
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 21:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8C730F922;
	Wed, 17 Dec 2025 21:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e17Vafts"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C740230F945
	for <linux-next@vger.kernel.org>; Wed, 17 Dec 2025 21:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766006557; cv=none; b=OKn4YhVw7IOpp3/mq3nEd/+RrZB9RQ4xwcnZsZax3xRTPGOO6pItcPvabYzRxrnTNugICzcN1ijeIz5AZ1rBIwJPcbhB+D5Y/lCmfOSoQzEY2/vi3LpqsFkYToUlElQvN8iMadJIl+vYrIpIZYe5EtOuWmIsPRbTcPTWe7F9R0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766006557; c=relaxed/simple;
	bh=JY3dgcn1u7eJZu2Hjg5ur+0hAcVi9dF9PAZv6M342vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsb1ld0pKUFhEuoyrl9Uwy4WPxAr6iiERAC3qQWSIkP/2L3+9kOrI7sqc0B6VpyWgkT8jU09kBXzhAPpR5HGSL0y3Jvr9lhksaKQMcqbjRfi5w/NpfsdhJvWrRw0+RlWnyO8898ScYXLtBUCcNBFoH/5MiR5d8YwviFUrjYvij8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e17Vafts; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8885b3c06caso40729926d6.1
        for <linux-next@vger.kernel.org>; Wed, 17 Dec 2025 13:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766006555; x=1766611355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jX15glnWL3+2x/G47NuKUQyXaXLOkKMlU54oI9amn7M=;
        b=e17VaftsneNgktQMTp8St9h3MAPcLlyC+DFZC/VrFsYarhUJw4XXIp81s0PJeNKhvf
         A9ndOqeYQjVZaxxwiacfdYxv1HUHVOopRvFr4HHY7pDZml9T7iYUo9cMWhsivRCd67J3
         0MOEcnPyIkYiqErUW0MJlx5Sq52iJrs3uf3SWwQWIJ7ubyk711DwyrfJ7jlca7hcNluT
         eSl7UGYWojMVU/JmKKQtzGqkxo3HW5+Mzl5FgJ0Gw83oTHCfycwxfFBQAWPv3RiqvcmA
         zs3ARkxv1rCDOwAEXFNjgrNj213mdNmTJ8Ek0qrHSgIMsPd97SeGB03XqUuDUqBf6o+3
         r9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766006555; x=1766611355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jX15glnWL3+2x/G47NuKUQyXaXLOkKMlU54oI9amn7M=;
        b=SyKnq6mY0EE/P4sUJh6HpSLNY+PMDuDm7MWi0rQKK4ar3iAhNRasd8kAgtaolpw1rs
         ZsXUA6t68ipaHvbA99FPfaecAB9BaqbKKgAs3Qh6RZXcA5WfkWa4SwqX6UJmF8lf9X3s
         bnns4lbVsRRXJNyv9UHKbGg1k6OaSfAXzE59RnrO8HWafCASrbJmVJmmlnc2LlKs00sQ
         USolvAG1vtj5lUWvrmlpLdRpnFYaFpEj7nZhSndmEEGwpvjxBCENRm8LRsTgMbwZBLNh
         0SWELijPtSEpdStYgUIafZVG3l+Ty/H505PTjrhQgiCT4piqxS/xLn+rO86tl5Oa3cjk
         qj4g==
X-Forwarded-Encrypted: i=1; AJvYcCXaZe+4cZq/J4R7eF3XxlqIHf4IyAnodqkgktO0DHkeO0JiS2hcnjyJiPoc1yAx7rxTLNHoIYXPrvPg@vger.kernel.org
X-Gm-Message-State: AOJu0YyNcw7Pb/yuc8INQlERYS9NyiyTGmRk0YdyyAggEvuH17dXm9HT
	yt29Eg92eRUZ60rp1XlJUNFcFiQ4NaI7vruJJxf4CsysCgCr87+IoZDFAlFf7VIVJ9sPID6CAxW
	IPl3AahuTpG8V+QA56RGCW+gI1VtCuS0=
X-Gm-Gg: AY/fxX4TLPHwBhaBU0tM3yiiQwc6xaxO/h9OT41a+tNAv5e/FA6qyubl4oAxf/LecSL
	ycowJC75tbo/AOYtkmJNy+sfUo+67uISQw7IVgIKu0eYSlz7u1Y473xjTGkmehMx5/Pm4THwNox
	P3P73q1tXZAyH6i+zRAhOzg/XG381Dc+0ce7Ffngc3n07NCWDVuUaF8qWpzlpzi0r683f5yCkFv
	WP33PXPn9678FVobLVSPUl+JRCo4mnv/fKjXWJqDzSY1o50nTZ8R5RhGEqwY+WeWdRFAvQ=
X-Google-Smtp-Source: AGHT+IFuqyVnExj9Vmw+ucfa6LEsoOn3kn5WxgmalWfIK8c0UZf4ziF2o4xRO1gfzLlrXruK91JTgNlkfSV/guMgSYs=
X-Received: by 2002:a05:6214:32c:b0:888:5a83:d3a0 with SMTP id
 6a1803df08f44-8887e0f1223mr258395076d6.37.1766006554621; Wed, 17 Dec 2025
 13:22:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218081719.231bc99c@canb.auug.org.au>
In-Reply-To: <20251218081719.231bc99c@canb.auug.org.au>
From: Yury Norov <yury.norov@gmail.com>
Date: Wed, 17 Dec 2025 16:22:22 -0500
X-Gm-Features: AQt7F2oZLNQ2ayD-UtOCGZqYN4FwcYAiefMtomjAgK5WHZLYczM80VUHe7R9J_M
Message-ID: <CAAH8bW_WhrdO15RU2GiqwOxOBd1JSA_5NSA=SBZ-4xN7wZuB7g@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the bitmap tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fixed, thanks.

On Wed, Dec 17, 2025 at 4:17=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commits
>
>   4f2c51b6bc72 ("rust: cpumask: add __rust_helper to helpers")
>   924ca2f7fcba ("rust: bitops: add __rust_helper to helpers")
>   ec84614d00c6 ("rust: bitmap: add __rust_helper to helpers")
>
> are missing a Signed-off-by from their committer.
>
> --
> Cheers,
> Stephen Rothwell

