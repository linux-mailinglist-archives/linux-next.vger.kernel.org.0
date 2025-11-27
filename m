Return-Path: <linux-next+bounces-9246-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FE3C8D6E1
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 10:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 476763B1ADC
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 09:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DBA302158;
	Thu, 27 Nov 2025 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnyxaoqQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC871E9B22
	for <linux-next@vger.kernel.org>; Thu, 27 Nov 2025 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234239; cv=none; b=RhZWzN9vVng+54JhGf9TFM7YUywth3sbX5aKPNxLZrVJmeqsHO07t0d1sRRJel6pNKF9dNXk/D/vWI6iTDHNUhlY8bgHuacRn7BJjSL8bRRmaxO9JEpE3NV54DfW70gOc8nNJ3sQT6c8OSwWNSBf8xoBEAZevxZlJj7S6/5nqkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234239; c=relaxed/simple;
	bh=ajXQlAXy+xZWqRNZMxGV16BqmcJZ+XqRXFsJV8VVRYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQ+CajabetmnHIjmW+nGWdLY6J5wa30RfEfPSjr9ZwKcQ9wFG2YpelWFYa1IEk1IqgUKBwIBWgRRdR4WB6tIVdIMZ/aePdNnW3V+gckD9ZWR+acwyRLnNDrGklYWGdWgAkeM3jegFdIAs+UkxZxcIq0NGMeMgUfkuvFo2NnfNtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnyxaoqQ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso545608b3a.2
        for <linux-next@vger.kernel.org>; Thu, 27 Nov 2025 01:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764234237; x=1764839037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfrIZoJrU7OAXOLYpsHpJL9f4WnVsbLUxBlZFV8ZVMU=;
        b=UnyxaoqQxbDtZDQUQWhidUIhsarMgqQwp14XLlkxlkWNUyVuz5SOtI2GKSaYT7e71Q
         zI1Gfx2VV06u8MlqVxQ6znfN+rWk528zTOZrRUL2sUCwwqzHSXkUxgAY5nHyTG9/ADrW
         eGGZMRT7gDRN0C+uWiRY+mE/B5YLV4cEAeRwjFV9X4U0ZrM0I0RAZG3O5O72s8Wwi3Vo
         3zCRQYiOfHqYI7txvTOyNMRQLHyVcXAmd92XuJl5Pc9GylIYIGzrFSGv/nPwid5iezkP
         eOsnwsbp0JCYEpm3H4ZAr74uxD1yAU/LACZajXIbF7dHYABQz4fiuRkXP33IsNK+6lpm
         lf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234237; x=1764839037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nfrIZoJrU7OAXOLYpsHpJL9f4WnVsbLUxBlZFV8ZVMU=;
        b=QNKD/NAddxOEbaRkM4BoF9jHU2J80Yg+gyf/vTD6pvmeW7WIkWS+2tSJQtdKnnxCQ1
         h9ikLyzmiRxaUShffFXZd+HaeFd8v2oJYPg5tr0+iCnQ7XC5WE1CNkRyhGHEbyvTp2ap
         IYGIAxb9S12/kziENqqW1ZILlZGoqj5jMk0Dp5NdvJl55L8BYZ25Jz3MXrr9dL74YU+U
         uAYsE5W+hFADoV7hSLEEOX2PbN/rhTD9sDQD4z8+BzDIJNwZzj9WiSG6EuSGr1yvaqFQ
         paM7YDux1lTEJSSRVN91thP4XFf6iE98EEt1aSqTqvaALFJgBumnxX6ixvSv3Kxzs+Ce
         /z8g==
X-Forwarded-Encrypted: i=1; AJvYcCV1GjUiG7xuU1IVgNb2xjlAF6XS2wceQt0VrIcoF0dbC8aKxDyEH+8UL4Y3mU8JriCbcl0gqbuOK/au@vger.kernel.org
X-Gm-Message-State: AOJu0YxK2JodYL2Ip9LuupTDXItFZGg12O3LgZLPhFfcoaG1ViqDhij3
	Dd8VPDtw8RKBW1ArzWNhYeQcXtVAb5nQ6092FxcBip5XpwJldu9kIBMFwFI2kChplmUKOr4r9Dd
	ZZx1QRY0guj1/JHj1tWGVc6tUBVgT2W0=
X-Gm-Gg: ASbGncsDZlc0fh8+IsI3CVEntALvZxraDysOBZdhyICh+vqCICfvnGpQHKvBFpqttfz
	rDP2Jg1apLhgBcohFClQIgXPxCKyFdtTWUlwvEva5RVR+JcyOQtqUyE+ZOwTH7hzsvbn2vO7aLs
	sdtbtoHFiTHQ9sqkv5Eq5C1WUHLuFrS0Xpm04RXYMcfFRBi+hkodBudzHzoVeg5WyFxx+jfjh0j
	9r1BXwroB0BFt1WW/vdj1slBgrJk6VnSZ/Thp042Di+gVhXvxbL2FL3Hc5LX4XsKXsZeE7QEHk/
	9iUnVw==
X-Google-Smtp-Source: AGHT+IENdWL8FgRij3kTylztig0dyjIRXibOlOD0oUruUy+RT5fgSXskdaAgGSTw3KAJAAfIuja+TsQDOL1OGMDCVzU=
X-Received: by 2002:a05:7022:799:b0:119:e56b:91e6 with SMTP id
 a92af1059eb24-11c9d85fd2emr15587516c88.23.1764234237215; Thu, 27 Nov 2025
 01:03:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127143634.52a25df5@canb.auug.org.au>
In-Reply-To: <20251127143634.52a25df5@canb.auug.org.au>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 27 Nov 2025 10:03:45 +0100
X-Gm-Features: AWmQ_bnuHXvJux9czSUFsijfo4jGaIq5kksQmINUfH0iyhugoAe0sDzW_CDN0ds
Message-ID: <CAOi1vP9N2JiMhOLUuK80JbkEDZ207U0ctgeD3JOh3y7NDf8zog@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the ceph tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Layton <jlayton@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 4:36=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commits
>
>   62b08ccdf4f7 ("libceph: prevent potential out-of-bounds writes in handl=
e_auth_session_key()")
>   cfe243a92cb1 ("libceph: replace BUG_ON with bounds check for map->max_o=
sd")
>   7d734ad7b628 ("ceph: fix crash in process_v2_sparse_read() for encrypte=
d directories")
>
> are missing a Signed-off-by from their committers.

Hi Stephen,

Thanks for the reminder, now fixed.

                Ilya

