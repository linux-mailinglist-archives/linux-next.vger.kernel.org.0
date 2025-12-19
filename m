Return-Path: <linux-next+bounces-9479-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8A7CCF6E1
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 11:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3182E3082FEB
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 10:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C768F2FBE1D;
	Fri, 19 Dec 2025 10:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEGqG6S9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB04627FD68
	for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140615; cv=pass; b=IQ1CCIF71keVVIXwDOBpaS7Nb4evrx3vxrcfLAv9wb9H8cJSTXXJlvJi+m9g5gpvpo4oM0oGKCECNg+ieGOySnCpOzCmnTyex5FalibJp/JfgIUQPTJHlamCwVuD87ai61tVw5WRuakZTx8h9G60JErAngpHWZ7xR2TQpue93g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140615; c=relaxed/simple;
	bh=tblstYrVBo+MYKvKh/wsw+Vw+xW+zrSxhvIh4gOWglk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hh9MPRC7tKROYVJ9GPRNtA0EGJuCvRdO093wHRcjcl7O4G2HT3dN7W0G22sgm1NnKGMjozivGsuB8xEp4L0ACUzCg7rYM9sbic0NH0Sxv+DGMFUNUdQdkNS4GEqWlMLw9enpkjoUMGxZFJTGOXVdHu46r2R4IHo8zpaQ7k9WMnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEGqG6S9; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0a8c2e822so3472955ad.1
        for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 02:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766140613; cv=none;
        d=google.com; s=arc-20240605;
        b=CREJpy5ZNCzSsABi8wVhfGUYVd8ZA2/zr6XIhU9A+Tb1guGGxH0RaBGTrhvePTX0Qo
         bblDuguueEwmSwI+X/Ot1/lJECOmucuG3ygYv3/CS/apOWaJGnkRBzrKpQCozq3hQiaS
         Acv+ennxHTWHWUlaM5VukkfK8jcuQxr+Sa8k1ZX+lqJEMnLKpYM6zrwyRsxKCYBSWpbN
         v4mjMfvzKUsg0oCKXLbbTRX8LFapt3riMVjxRGKh1k/8hx2rhSAAV9eJlETmYhzgj6jC
         mu328HP4dTQQTtpqF2yYIMpjk3EFNbyA2Pi3p9j4d/KDKy4XgBXnB2k89i+4nUYMYwJj
         7/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tz0OnXdDfGXhob+Yvw3jLABxpuIo7XrFUYSgNjxy5nE=;
        fh=e2LiyIrlcBTddtkCp/I9jW9nfaMsj7bKgZyoULxgmrM=;
        b=NAsXBduB01XXYSx9b+IjWbhAQOfzyb1qyGj3XwdqyDrdIjZid+sZM3k6Y1UAuBPH1k
         WjEVnYEZQxttnW7T4Utt9I1lWi3kYajtrqcuDIjCBiLgtzJDJpI9C5n5CITFzUmb+n6J
         0ZuS68hmNNTThxO3AaqoZb2D87HbvNswqJZLnplV0u3BjwH/LiK9dP18lIEa3OIuPypK
         vWugzdajGMnG0+wA0SE0SO60sPeO26OriyrC7bYqXiwwZ5vFnySRuohev8W9SxxspA7a
         SMa6VvDrPQjd8kT+3Lmt5pRLtU+8L17lkQ0Gux+L7ERU7Obj15dHfy8clTPIT/ARNtKc
         b5JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766140613; x=1766745413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz0OnXdDfGXhob+Yvw3jLABxpuIo7XrFUYSgNjxy5nE=;
        b=nEGqG6S9L2zdvHcxeV1Ex51tt+nBGe7hdLYPZn3wLHzCAml7f7hDiulM50wogO4lb/
         d6gFpWFL0f4BbfOAFI8L8iF/5vD/H7QIQEf1P+YEBAdsA/yavm4MhU1F/6PLDYzwY92v
         Irnq+Hx7709U5hMbrp+VsZXA6ZCAGuwFQDdDDX1c5RBI9eojwfJu/qqL5MDEuEFZKbXO
         ltX+VuILUiO7Jd7EjAa/OSH70EypRn+mNcFd8+VBYtyv6tEaMrrRjnwHVtywyNjLG/uO
         NB2jQ/55Bn9OUrPRfCAd4ap5K6uJ7DZmtE4vF451m08ONDndA/pPddoO6i1MoOQrQptd
         dorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766140613; x=1766745413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tz0OnXdDfGXhob+Yvw3jLABxpuIo7XrFUYSgNjxy5nE=;
        b=hwKOoqwGnDZAGcZ9z67uR/bn8VqpybAnArnQIkp8VilF6XjEgoCaWC0IJtIxv8tx2v
         iJoEvvyhkDl0r9XU8UCHGlMzq6CiZpju1dHddy8peoQN6YyWmBAEylu/f1uWl3ijKLqq
         mttF3O99Akm3XnGGXmQHX2vfZLN+2Rjntg1xWrwhwAY3vlkh3IhbuysCPjxsqNqyBQKe
         SOf18eEVPQGL7AOZlb7aQs/iE52tf3We0AGSKXmyC3TqEPWiVoO4+TM5PPipaVo3s+vB
         MSlmP9hPAqVdlj7fbnfhe3H1NRUAKrfkNzFPbvF+de09+lYqLXLJyfaSfA9yR9qB1jVr
         sWxw==
X-Gm-Message-State: AOJu0YySW0418CZDKw96CTCBbDxNZbXKLwiqd51Ef4Ycw4C3llnHhTNV
	ooEZfFkF0WXnxWfKfQcKdlw/e7M594P+hEnD8uWY4FjPF4BuUScHlsUnlE8B3Onv+Uy+z+/CqIN
	7MWuOXbLu4t+LGeyWs7W2T0ltYBwRhF0=
X-Gm-Gg: AY/fxX5Lo8s0qwCqTYLm2okjBVySTEJcelWRZUwK9yZ6n2LKx30SObfVpUUSQsctIp0
	b81tsk55FPpnmkJN3hdqFaGy1K+7d52y5UuwhHsdb0i7JKkJkHg8f5oDvxflvoF2zz4Eh0o2lKF
	O+pP6NPWXYYHT2elu8TG+NpM3/pv5mVIZrGRQBkPK8rxwQxad/yolo2Q8iBb3aDEFQY/3sni7eh
	yJbIqRYRNhbEz+hM8KuC5L6uEVW5/rI9nYEnl0/YEiI194H93JR8JxTnXsLdph5cAolzcQuJzb1
	79Cxh8JvZpVrbSRkKm/N+Xn0sXFG5BbjqD0TNCQKGLL1FwnLa9udD6vBmOUcV54btSlwDb/MaVF
	GqLSibrhPqys3fg==
X-Google-Smtp-Source: AGHT+IFcdztVh/rzk8JUlhwXsYwneGfY76OyqWvo3ZKk1KaXdl8GkTSbVnS9OEUvb+5Ksw9Q03iSPndYmckP0lOaBcg=
X-Received: by 2002:a05:7301:928:b0:2b0:502d:c27c with SMTP id
 5a478bee46e88-2b05ec90ac2mr1036108eec.5.1766140612600; Fri, 19 Dec 2025
 02:36:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215184126.39dae2c7@canb.auug.org.au>
In-Reply-To: <20251215184126.39dae2c7@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 19 Dec 2025 11:36:39 +0100
X-Gm-Features: AQt7F2qkE0-bSe7bGgoI8knq0JJqaURpp2gw-0TGsiIVxyqiBa15stCE7WKkfoc
Message-ID: <CANiq72noq=p-YX6N_KdAMSCgeCDRLOdwSuvgrX5xAckLcaZ2DQ@mail.gmail.com>
Subject: Re: linux-next: trees being removed
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Larsson <andreas@gaisler.com>, 
	Christoph Lameter <cl@linux-foundation.org>, Chuck Lever <chuck.lever@oracle.com>, 
	Dennis Zhou <dennis@kernel.org>, Dipen Patel <dipenp@nvidia.com>, 
	Gabriel Krisman Bertazi <krisman@collabora.com>, Ingo Molnar <mingo@kernel.org>, 
	Jean Delvare <jdelvare@suse.de>, Lee Jones <lee@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>, Tyler Hicks <code@tyhicks.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 8:41=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> clang-format            2024-08-02 13:20:31 +0200
>   https://github.com/ojeda/linux.git#clang-format
> compiler-attributes     2024-09-15 16:57:56 +0200
>   https://github.com/ojeda/linux.git#compiler-attributes

Updated now; please keep them -- thanks!

Cheers,
Miguel

