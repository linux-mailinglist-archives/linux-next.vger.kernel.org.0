Return-Path: <linux-next+bounces-7485-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B217FB017A6
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 11:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 777F13B92AC
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 09:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5DE279DAA;
	Fri, 11 Jul 2025 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kO8LcmVc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D5026D4F1;
	Fri, 11 Jul 2025 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226071; cv=none; b=o9QG8rcb7FRKT8QotHf04n7VQL5SUqRbwgLg5jvq7pxj4mdArTj4nL+DkOyOf6Sr4fQroz1qYBXGcZ1NXxynlbR2t4PPKR18gf99Wf0hKAzy4KnSPNyu9AulY5JLspk3Ceiv022hyuAXlWmfp2kW005oClNrl/QKmb9YsdMA9b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226071; c=relaxed/simple;
	bh=2LD8FhdgOCGX/EQR3ZVwnB9BDw3R3QRoGfmA4kM76JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVRd/yfIyHRKX2T85ktm9qXvTMUH7UwS5IAmuZwbLE7n07XOso9s//GxG36u/zOOcpVnhUJGRwfqZ6yHFg0hsR9VvTjR8duVy9ekYOrVALLV8nCVusVYx15Sxc3Dple3yqm8GLvhCoqR51pRC/Ooaun5bCcU9NRHeFnu0AlYAcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kO8LcmVc; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso2120071e87.0;
        Fri, 11 Jul 2025 02:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752226068; x=1752830868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMvC4H7Uqext4ur1pwN9VfNslmOV4H4kdne9+9ptZbs=;
        b=kO8LcmVc5eoWp5TzwyA6AM9ardQyhnoUmaaNTqonuAWEpMbt/FMmDZxv6I4ggZXShx
         tLpyWT5/LijGvhTrjX9/derKQwnBW+6W6TYP0qs5z+q1elCWc7bgVhBDF15/7xEatXE3
         vjvfyn0HIYtLhlwxGyUyXZ/ouXG/tPdFvOSD63NHWB8+hakTHKy6voJD4bUJP2+Iy7s7
         uSMWUYKbyb1fwIXE9mSSaa/MmD3HscZLlW6QCVlxdE6VA5QtLfnKVdynRh6ObC8N+0lX
         w+Pi9GXs+QBRP2v8vJEoWW40+SCs/d9BIoMQLCZ+OlHg8XygGXhtMEvEf0gNDCmsJE6+
         ugXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226068; x=1752830868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMvC4H7Uqext4ur1pwN9VfNslmOV4H4kdne9+9ptZbs=;
        b=pQ8rq+bHWCSRJxAl7ChARVtN2hsu8+0EHMb1B2I0cyd4VRonB3PFZ0VQUD1iu24BZn
         38pMgkT/Fs6+wIg2rglhhIvXT7uOnXnqvwXt6JDFcEbTkcQgfqK5WgOrl9T3+MmcpD8u
         PEjdhI3v6EM65v4mcvChnwuTiZOvbWVMKeiXfWWdr+emAloP/BLtQ0M6gGUyhDZDmfzU
         URsMUjKBWOuQFxNEDaMO7KuuswMPV78gb8WQDiWfXIRaqkpGDnPzQ4O2VNrljY9ypmzT
         VAkuUFrRxCqfzS11UFLIm9/4cV9zwlqjw+zJevpJNgr8wZWDKZ8UZ+dKIag+5OHtmnor
         YN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNDnkhsIwNj6IXcgKQUlus5T34mrLQrMswQxv/tp4Tm6xMuINO9D25yxJL4IE3URLQBsvAyaPIrgq45A==@vger.kernel.org, AJvYcCXnFE1jCmBejYNPhU3j16QAg86RDFEQgvBch0X9uCR0KCSSQKSFaNl5VUSxonoxsN+zRnVny+y58KQqg+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwztZhmY3tt4aa4tuSuRqrADn2gA7MzALPDS2LFoeGIHyFFbWCs
	vt/lapyTO3pZt58LTv1tG4jEPbsJEZtkjUVaVgy0xd+R5BAWdjyQM/HSJGg5B036UuSCJSOIm38
	4MR8lq0A3RDOTikuUL0N5N2ZFUUlnqobeYUEkl8fwD3fk
X-Gm-Gg: ASbGncvAmmkMcP62fx8/PjUHOWtwmv8qPvA2gZUxe14fabyi43n2JINxHl/wXMe9Qfs
	bprTlwY6gQoLONU9N5znxRbraGyE1bXAENdmv8VyoHRpXTNIVtIjpOe+wRcFD/MW2BbX9eJtFtz
	C7MA51QH/TaJVOL66lw5y5fv0nsyveBLwcOH6xNw84SPNzbRDxBzlQ5XCrnUQKKTXEgWSA9nbR8
	aifUG6Mn6gOPxJMfvmSt+M/Hw2QMkH7pj+2vq8v
X-Google-Smtp-Source: AGHT+IHQMtG3d06n4FdVj2wWxUI9EEG4eiUHR9Qywxw/18UaJS+v36uNM06HwJlJwVAU14njOm0wzeuJjIW1R2OOSOs=
X-Received: by 2002:a05:6512:1586:b0:553:adf7:e740 with SMTP id
 2adb3069b0e04-55a046094f4mr538857e87.28.1752226067863; Fri, 11 Jul 2025
 02:27:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711180410.49f64e9d@canb.auug.org.au>
In-Reply-To: <20250711180410.49f64e9d@canb.auug.org.au>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 11 Jul 2025 05:27:11 -0400
X-Gm-Features: Ac12FXwTg5dkNdzpko5KekhsTGMfR8-p-_MbiXVD8QcgFlswrjeoFxL1JYFOlk0
Message-ID: <CAJ-ks9nqyLJrqPYDJme2tFDY9HJNyg-x8LA0HPY653rCN7EkbQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 4:04=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/kernel/platform.rs
>
> between commit:
>
>   f0a68a912c67 ("rust: platform: use generic device drvdata accessors")
>
> from the driver-core tree and commit:
>
>   fcad9bbf9e1a ("rust: enable `clippy::ptr_as_ptr` lint")
>
> from the rust tree.
>
> I fixed it up (I just used the former) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

The former version looks correct as it removed the line modified by
the latter version.

Thank you Stephen.

