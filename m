Return-Path: <linux-next+bounces-5967-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD82A6DEEF
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 16:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C026188D959
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 15:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6CE25E81C;
	Mon, 24 Mar 2025 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYpjCXGQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BB72E3392;
	Mon, 24 Mar 2025 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742830870; cv=none; b=X70dDGHUUan07OAn9603IFD2a8aBFll9g3HetMCGgJAMCpFY7PGBigb0HDg/l9l4VkSxfJN/SOGSCC5wnJ2vIPyNVrsoV0fBbyH6NicrEsmbxsPywl2JDQvVteo8MrjQna/CZlY3y/Sm1lFV0vhZCwsK9GWaP9ePEYbwCVmiKdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742830870; c=relaxed/simple;
	bh=CUlMWvKBRXz2cXYE7T73wDHkbh5hXcN4FEkxEdhUajw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+1zdeJDo9VVaUVPwrFK5u6VH1kY7yII7A8pWGQDAC4AIe4Bk5fGB+nWSmSxbkTWJE221TXPOTbi9OtzK9yBq9rXbpHB/SJtBh/PzNYw5YY3i3xG0td95cXkM8fOnvg7NX9Iwp/5IxFKa6g6Y5K+pfn9AKDpdmKekX6hO/tI44E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYpjCXGQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6b9a7f91so1409833a91.3;
        Mon, 24 Mar 2025 08:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742830868; x=1743435668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUlMWvKBRXz2cXYE7T73wDHkbh5hXcN4FEkxEdhUajw=;
        b=gYpjCXGQkieytDPXJhEEFBL//iIArSTna2i6JiyS534/XhXjfzdHHjrivY3WQyimE+
         3A2eYcrHOO1fIT6daego4peH3p/n8h5nIjyxL12gvJ3ZNl1Ft57QuVGGF1kcaLYA1bz+
         r+Nnz07RsoHUUInsJEXmf2YsDN7xDAY7xJWJH5Tf9B1u92zTMOZSzJLZJSYQLo6+yTn2
         8FUZTJuET0rXtsmOPh6ZgKKupNhW74jCmViWsqOdWU7wTSgZ34/aqtxSzF6TIcYZkCae
         mJqFBUQQZiPYnJ3Me7Bp9GxTdEfxp8bIixY6EUGo0vw6XKJvyc4VXaonbucOPQ9pcOXR
         cTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742830868; x=1743435668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUlMWvKBRXz2cXYE7T73wDHkbh5hXcN4FEkxEdhUajw=;
        b=Co9p46w4ML7WIddwwWgV2k9rMKLQLC9qcSop6JTb8UQpsx2rhzEx+MdJDd5d0gsBOS
         NkdQSk16tMwhZ1/75AY1/rr0Dpzqa9Ts1P7Yv5R+0VYmQqddWMAcAXO7BlU4P186Wgz6
         i51knj4HqoE59hV0k+PUN9qO+XlWgBo2sY6gv+0yl39gbdSQOLfBmyAO/ugylKVneVys
         aJcZ/cfShzZJ59jRHT3WM/YJgUjh0Pz9/G/QbFiTocewfQE9qxGbYrqQRQ7xzXZeF3Bp
         8sGvPgy+5qo7h05LIEBHTPCUi1Og+Ic+D4oCi8kFbR1cnuzzsiO2KDHJAF3oz7mdJafg
         gF3A==
X-Forwarded-Encrypted: i=1; AJvYcCW8JM0NMB8cup6A8O82jN/VBRLJulaZXMOeoj/bVsijyde/w6kUwcV2s3H/JxBKOKQCZJDT1sRmsJZmyD4=@vger.kernel.org, AJvYcCWUWI/8JFSH5ETg+TGkE5eJ20nh43WmlePxiwLZrSsPiwQ4UH/K/BaDFgVMto3pGHBd/+4hHPQlkv7Nfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym4akTN4eIjQwoHJZ2CmlhGHJ3YaG9ddbwY5cFCJbyeGojDBSA
	rgKifb77KErd9hiEcScMhG+MCh3hDgLHAki1YfLWxjPPsbO1V4Gz2x7XqeyEYho6ypDams2IYQd
	ygURf9biXhWPaqx7AfsAXSmXXp/g=
X-Gm-Gg: ASbGnctyN4RA28MsM0yoZJa3SG89yvjBwshW/Bh3UoyvI9hgJDOeezBUsC2/QdO58ox
	xE3fxCdZLRL9rY+ZDQlGd70lqKqwCtVE3nmWfpjh8JOvj87DhplB/PTM51A+Tzbe2aBP+ovHEen
	UQjOspMLPYabAIEKgCdVj12jy1MQ==
X-Google-Smtp-Source: AGHT+IG6Q6z9wMcHDCYb1cBmWDfhXGHKsesdIiFjpGG6rqmLRdWOvvRtp1pxwCwfNPtXnbEpochGYO/1bNSU9Cc/96c=
X-Received: by 2002:a17:90b:33c3:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-3031f1156f8mr6102286a91.0.1742830868111; Mon, 24 Mar 2025
 08:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324215702.1515ba92@canb.auug.org.au> <20250324220629.1665236b@canb.auug.org.au>
 <Z-FJH628-j2HCuaE@cassiopeiae> <2025032443-recharger-legacy-93bf@gregkh>
 <Z-Fhf3Cn8w2oh1_z@cassiopeiae> <CANiq72n3Xe8JcnEjirDhCwQgvWoE65dddWecXnfdnbrmuah-RQ@mail.gmail.com>
 <Z-F54IQXiY9IHjeM@cassiopeiae>
In-Reply-To: <Z-F54IQXiY9IHjeM@cassiopeiae>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 16:40:55 +0100
X-Gm-Features: AQ5f1JopEtr2VqbNHsvQYqxUsdq1wAwrueeKD2yegsnJrEA4WZX8EqAgrBoHOIg
Message-ID: <CANiq72kd1ZCb8X+s0wWT0ENjPUJ_P8iiUa2gZ==X2_r1V0t-JA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 4:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Correct, it is the full conflict resolution of the current rust and drive=
r-core
> tree.
>
> Thanks, the attached patch looks perfectly fine to me to add on top.

Thanks for the quick reply, then I will send it and add it.

> One small nit: The "Link:" tag should rather be "Closes:".

Sure, will change -- I didn't use that since I am still not sure it
counts as a fix or not (so Reported-by vs. "Found-by", Closes vs. Link
etc.), given it is "in the future" :)

Cheers,
Miguel

