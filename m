Return-Path: <linux-next+bounces-2301-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2838C5B7F
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 21:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EA4E1C220E1
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 19:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD3C17F36F;
	Tue, 14 May 2024 19:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtESHlSQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD97180A94;
	Tue, 14 May 2024 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715713687; cv=none; b=S5OViuKOKCPXiikZAK9Hd5cLCyIKCdJkL7KloBfwq5eLSmJtSpHQOv1h7TKAKkIBhcIeYvsDbMXXn+777U+Oi34ipM6gFrBM4LlGzpGoD8b3vllVGLR0a9eOzyMyTFft+Ii9GqeUWlqykeTHCVnkToO+qIBJJN3kYTItt6UyY3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715713687; c=relaxed/simple;
	bh=V8kl0vk+zhxlMwqHSJ01OCOj/2EJeFrBwxvtafI4exY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSX9UhWlsoWoZdRuPdVuO0TzfXREKBjzVPRW0MHNvvBjT+yDqU2wdnfZY+A4RrzTdXfEi2WMex8lu2kG8mDXZmzZ50YKZyghvrGFKh9D7wNTZYB8EHQx548QNp49xm2d47umOeu2+ec4Qiq6ggrukIuj5ZjRxkjrfvd7qOtIVHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtESHlSQ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6123726725eso4824076a12.3;
        Tue, 14 May 2024 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715713685; x=1716318485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7gJ1jGOfc0uuKsE3YPwqokUa9StmsGv9lzNrtz5bw8=;
        b=BtESHlSQThoo85hM8WGS0e35fO7XV+WLmgZ4helCiqjXachZkvWuwJNj8Vrt6jpAnQ
         qEBVCJ9XHot4uaVzCT3FkQoTVlpiKfzyARh00XVft3oTH8U3oMjj1Ed4Ox4Fk3k0+mvO
         2zvjqNrOi4kb0IpQHgAR7IvKggcnOkqit01xaF65ftbzKNcpsJvlmgQlCIuGjDcec1zG
         7PRQO38FD+ME3bjIDL+VdL7/bW9oFkGMpoYNh6Pbo/eTScRg6mNTsQGIWDcBUte91FAS
         IYd/99HRfMDugBnk09s6i/NVNFpRHxzahxIBwh8ciS6hm1NMpTokbIBL3TIs1ZdiqfN3
         IUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715713685; x=1716318485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7gJ1jGOfc0uuKsE3YPwqokUa9StmsGv9lzNrtz5bw8=;
        b=iT/hSkb405Z5e/7AFkFGFTsXiIdwouzG1iE/HMXDbNULf3GrbeFwBYJ3yRm+XgC3Pp
         OVG6pJ64HAxM9UAJ3yu/mt2CaWShaz/2adbCk27SWuTqekfPtcGyGN3FpJBPBAOOoQEK
         zuWuYdchECtAOnmomqjB9tud5Fw9xxPx9AxyNKwmf6fZTue36VWxYO2Z2IAsCX33RkFu
         7nPToyisi1Nm/PWzWJuGJZD3yEdBYhuZ7CfDmMOUir9l8ivtjx3BpL8c3OekM9T3lhGn
         4/lOiI49Sb13Dsk46HT+SfDwUurH0jRLmJEONHA07qARzqVIaUbZM4FzywI5fUTxt1jY
         Ux/w==
X-Forwarded-Encrypted: i=1; AJvYcCVdm2FxsKtCLfZmACl/Rz5mKV1T3gbK7yhu3OlFpM3UbnvWxXHrc2g6aSLWIRbZ4LQWIeqCUJgxK84CxIjaVIT/crlAdWUwQNJSkQDyHv0CYbYUZtC4XKgd3IrZX1/ByCOZk7M6OIIgag==
X-Gm-Message-State: AOJu0YynR9hT6LdfkGOKoziT0gYC0Q+6CRJJQ3pe9ExPIBFSO5zhBH1/
	2cD/Wlf7VSsvt99rTlPb186nULrpbbQgnmhAoV/zQP1RiQeJa+v8kXYdYC5L6UFXUDxJwMXT2KK
	dyviio8Ktino+nV1+yZmogfZ8ZC9GzF16
X-Google-Smtp-Source: AGHT+IHCCEoKj19UznkogC+zYoUc7bQR4OFX0YiHMuxVUCgZ6i1gyjrpfzvT6eBTiL6WIXw1/13vW0/aDeCk+Z3YrfY=
X-Received: by 2002:a17:90a:ff91:b0:2b6:ab87:5e5b with SMTP id
 98e67ed59e1d1-2b6cc140159mr11949740a91.9.1715713685105; Tue, 14 May 2024
 12:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240514171417.492a1301@canb.auug.org.au> <CY5PR12MB642964F3A1D72F422DCB814BFEE32@CY5PR12MB6429.namprd12.prod.outlook.com>
In-Reply-To: <CY5PR12MB642964F3A1D72F422DCB814BFEE32@CY5PR12MB6429.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 May 2024 15:07:53 -0400
Message-ID: <CADnq5_Mf5zUJGajNnrhJB4qAAe_H--Xd=+ABUS6JHL=vvbdVXQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To: "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	"Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 2:20=E2=80=AFPM Nirujogi, Pratap
<Pratap.Nirujogi@amd.com> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi Stephen,
>
> Thank you for reporting this warning, I will address this in the next amd=
gpu patchset I will be submitting in this week.

Should be fixed with this patch:
https://patchwork.freedesktop.org/patch/593995/
Sorry, I forgot to CC you.

Alex

>
> Thanks,
> Pratap
>
> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Tuesday, May 14, 2024 3:14 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Nirujogi, Pratap <Pra=
tap.Nirujogi@amd.com>; Dave Airlie <airlied@redhat.com>; DRI <dri-devel@lis=
ts.freedesktop.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.or=
g>; Linux Next Mailing List <linux-next@vger.kernel.org>
> Subject: linux-next: build warning after merge of the amdgpu tree
>
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (htmldocs) produc=
ed this warning:
>
> drivers/gpu/drm/amd/include/amd_shared.h:110: warning: Enum value 'AMD_IP=
_BLOCK_TYPE_ISP' not described in enum 'amd_ip_block_type'
>
> Introduced by commit
>
>   a83048bfa402 ("drm/amd/amdgpu: Add ISP support to amdgpu_discovery")
>
> --
> Cheers,
> Stephen Rothwell

