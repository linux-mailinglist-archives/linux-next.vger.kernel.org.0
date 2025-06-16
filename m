Return-Path: <linux-next+bounces-7153-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B262ADA644
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 04:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72DB13A9942
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 02:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C647260B;
	Mon, 16 Jun 2025 02:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXC1SfUS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAB423A6;
	Mon, 16 Jun 2025 02:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750040406; cv=none; b=lN1HKyn7qwVdIuYkEAoEe6qqHMma/XrPoejzOaAg0QPbH5v2GwcJGZZuMTlvTORfvkrYxbaNUPMSPAHPjMu/apbyWkKMXY4fNAcbxQT3YNKo4TNDPGCHtOxJE8HG/SD/YxqLikOp5JgHwHBng0slz6YzKu3tQRjMbptAiddftiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750040406; c=relaxed/simple;
	bh=b3hgF/Lbow1csUq8IcUa1wBJ57Qo7zOfK3OYewWbzCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E098Jy6h/AIKcl5ZN/fchNlX/MZx0HRYLYoK9AOApJ8HN2247yzt1lp4kc8xAPxyjHN9jAbzDN6igjphMYn+lZjFwsaR9164MLgQSB3FOLrEOYmuPYbxjM3OAIH1wON68Hyn7BXDYy4MVdygTdPeb8vJZc0GOAoY22L8CP6pvK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXC1SfUS; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b5226e6beso11809761fa.2;
        Sun, 15 Jun 2025 19:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750040402; x=1750645202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Adm7XuDI8badZxJVxnby3K6Zq8faQmVMQ1TgWod2DjI=;
        b=lXC1SfUSYTpORj8XNq37rI40nFZ7yHuFmvllqSeUsMM5JBzq0CprJy/93yI0tbqFHU
         73h3nM93sfSjpyv4PNB/+OA4Vj2xy3LsjYhODPLQ/JbEN6lT6gtB9CYSuI0HtcHjtVEQ
         GddWHhLeS6vDROVAP5SX3Wr7ewIrfzAaX/Zpbk6b2VfRAdoSHDc/aXSvxSGoCPiKjFkt
         wEcuwgx9/QNeJTyIbSvFNAKv1xiUxckRsYDKqHHpbL385ROab/23+LZYIVan/kE654aK
         VnX+XiTrNHvdB5hnW+H5SiXQDhN0MK6YiXUJdeXznK4uyHKSC/6xGPxIX3AYtj3w7kfZ
         GAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750040402; x=1750645202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Adm7XuDI8badZxJVxnby3K6Zq8faQmVMQ1TgWod2DjI=;
        b=pO4uvB4XGbXEburZbLm3MbyutZh1A623ZFHYaGBZUhAnF8vggZQ56zw4s6vTP/nf1/
         QNICfgfyZG+KAGNfyKo6ln7qbd+G9RT+8mCV+Onh/hloXvj0ud75bgCH7OIta37c5Tat
         nmgPQ7TBPDHnWE07wjfrU1igAdS0PXYfJbz/WppbqHkqDnFXFh8atHQ34f//v5qoIF6F
         NuuPwSrPStaP8HydQbFTKB5D5LVkFy2DIZMCeZhKZDJxgGtA5RDIkh/xDUdJs1445N7P
         DMZiMHGKJx5avDuvNz2FmF91WhJ6Dh+dUSyRrR/m4hkdXMD+fTi79lno/j27r2XJ8cHY
         Lw6w==
X-Forwarded-Encrypted: i=1; AJvYcCW5X1btABRyLX1UTURjJ/F2iONj30tKPXpbktoa1orHbIGz4WiPY2yj/qiFm6Aq/ePAe9k0ciQy3neuAg==@vger.kernel.org, AJvYcCWIQ+0sHqBLrR0KkepRVkqh9mU2LG+oPjxW65ROGkmUvztScx4j72wYJew0ty7GPoc4a8aMZ/t/8j1YfvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNA2+fZZ1C4Uxgd9zM7ybrcOWH8KvdfaBZuXj9clj4mzRo51D1
	DRZ5zxvNxumVlsGkq4MnzNC/xcrTIFBcUHTYeEkqe+fR7K4CrVdjg3rlgBJyZw0pwRSlmB+FSSg
	7SOOWSgXvvqjP0yA3D1ijR6Z0tQqIZ8M=
X-Gm-Gg: ASbGncvxKtlLwjayok4Sose5Z6vBm2yavOoYl+DVPmY7nIzKU1PPmj/D5i1OUbZMtSu
	Spam1ki7gzTLqcrnEBOPFiK0t4Z/8RrX33dvwDwiv4s/4mWEiWPf2FlbimeRl6i55HB+A1hPr3q
	2aDkFbZwax/1ypsQZjHYeLzBZOadSB/knA6ynoCjAUIfs=
X-Google-Smtp-Source: AGHT+IGKWYxnv30DZihQ0w2N6RU8FRcQfAw0BZMV5/EUEN/j0MUi5fBTXIJXQzqTJt4lAiWsilE6m23Pt0ICDLLWis4=
X-Received: by 2002:a05:651c:79e:b0:32a:739d:fad with SMTP id
 38308e7fff4ca-32b4a6108e4mr14588161fa.36.1750040401733; Sun, 15 Jun 2025
 19:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610081759.185e7982@canb.auug.org.au> <874iwo8shn.fsf@trenco.lwn.net>
In-Reply-To: <874iwo8shn.fsf@trenco.lwn.net>
From: liu shouye <shouyeliu@gmail.com>
Date: Mon, 16 Jun 2025 10:19:50 +0800
X-Gm-Features: AX0GCFsco9XEuTsjS8HV0wL9rQCYkshAkMIjpMWIrmmY7cbYbv1m2ur_M22qIis
Message-ID: <CAAscG3X1Rg3YE3+FvNuyK_0eRtz6Q7FgAJBW0saNYNQkigPZzw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs tree
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shouye Liu <shouyeliu@tencent.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Shouye Liu <shouyeliu@tencent.com>

In the AMD P-States Performance Scale diagram, the labels for "Max Perf"
and "Lowest Perf" were incorrectly used to define the range for
"Desired Perf".The "Desired performance target" should be bounded by the
"Maximum requested performance" and the "Minimum requested performance",
which corresponds to "Max Perf" and "Min Perf", respectively.

Signed-off-by: Shouye Liu <shouyeliu@tencent.com>
---
 Documentation/admin-guide/pm/amd-pstate.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pm/amd-pstate.rst
b/Documentation/admin-guide/pm/amd-pstate.rst
index 412423c54f25..e1771f2225d5 100644
--- a/Documentation/admin-guide/pm/amd-pstate.rst
+++ b/Documentation/admin-guide/pm/amd-pstate.rst
@@ -72,7 +72,7 @@ to manage each performance update behavior. ::
   Lowest non-        |                       |
 |                       |
   linear perf ------>+-----------------------+
 +-----------------------+
                      |                       |
 |                       |
-                     |                       |       Lowest perf
---->|                       |
+                     |                       |          Min perf
---->|                       |
                      |                       |
 |                       |
   Lowest perf ------>+-----------------------+
 +-----------------------+
                      |                       |
 |                       |
--
2.19.1

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2025=E5=B9=B46=E6=9C=8810=E6=97=
=A5=E5=91=A8=E4=BA=8C 06:23=E5=86=99=E9=81=93=EF=BC=9A
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>
> > Hi all,
> >
> > Commit
> >
> >   47cbe79dedbe ("Documentation: amd-pstate:fix minimum performance stat=
e label error")
> >
> > is missing a Signed-off-by from its author.
> >
> > Actually it looks like 2 different email addresses have been used.
>
> Gee, I must have pushed that tree at least five minutes ago, you
> couldn't find this sooner? :)
>
> Shouye, can you send me a version with a matching signoff, please?
>
> Thanks,
>
> jon

I'm very sorry to see this email so late. This patch adds my "From"

Thanks,
Shouye

