Return-Path: <linux-next+bounces-9363-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68759CA9D9D
	for <lists+linux-next@lfdr.de>; Sat, 06 Dec 2025 02:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C83D430C736E
	for <lists+linux-next@lfdr.de>; Sat,  6 Dec 2025 01:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610CD2EDD74;
	Sat,  6 Dec 2025 01:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="COjg6Hlh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3002264AD
	for <linux-next@vger.kernel.org>; Sat,  6 Dec 2025 01:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764984773; cv=none; b=Sw/UphK0tO5FCKO3LjIGOhetVrgkq/jc0CJy+zgXqhiyy5Z+VbTRUyzbAloOI9lKqQQm9VZxS/szgXM1KsB0gssyonwuuJ77OrEbKnJrWKS73OYGAZ9ys1p9OpKxSgad/z0xRJErAO9UvLVdycG/SYogMq7cm3kOMx3GYvYbz+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764984773; c=relaxed/simple;
	bh=G3uWtlYMhc/P42nV1aFlBObMwMb7uHpwWh/Lw8T8hY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TaXYdohe9iGHoW/fvCXmWWPy8vqX082s5vojB1FeeSDV8X6mr3QQV7eH91yvkuTCr4hHmZNtwYdqv96vI+s5es96Ax3FGCNB+HUze+QhJIwkjoluRoO6eXpRAYqVEf0LukSC87go2Xm0oHlwMzxiMKMTN5Nm78ESaxjMxW157sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=COjg6Hlh; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so577997266b.3
        for <linux-next@vger.kernel.org>; Fri, 05 Dec 2025 17:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764984769; x=1765589569; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hE0FG+S9Az3jU7SddvjaG88pIGPfxI7jbwuXxfqu+w4=;
        b=COjg6Hlh1G5IUpRRkWhBgjlhiKFihnytRebT7TBqQUnSD8K53+V3DRyOBfbOpKP5sP
         POVPkE/SpsTt4NDrTf/dMPeiHQj9Ph963sZKgeC5NNe7hQToS3qHlWglICE2vyahB00G
         /05f3I+SoTaM2i4+y6hKKI9biZ+CZjUp8Jfk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764984769; x=1765589569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hE0FG+S9Az3jU7SddvjaG88pIGPfxI7jbwuXxfqu+w4=;
        b=IuK01ba21C2YyYp+IrbWDHD/Fb8rnIX6xag1c/cw8xltGxlFtbVMxuvydFrs4Zg7GT
         bYgY+sPiE/wBWngAuKjNSlozwQSeJ2fKK5uhCbtmt+E53YI0Wlj42uAeOEit3vfwOzgl
         mDt29tayMtFbMm5p4cBIaVQ+cQpzHGQSXzmmeMnQSJ0wikXA5gGJu16wj03ndzF2k6QW
         GYybPZqTGp1+8f9uZsmPw42W0ly+j0lLCO7iBx065X73PiuC1FeCxt3PZlbj57Gizx0K
         uta3moDsXLwwjwdj1D5WUtkeHBvwNQGXFcV3pqwY42oOY5Kr1DVC7UhHT9D7Y5JtBeXl
         ixcA==
X-Forwarded-Encrypted: i=1; AJvYcCUe5q6H45PxIQlmJ0u9rZip1HKQcm+/2xPbMWTJKe8tpO1xmq3/v+2JFhVO1WYot4eLFCYOY+v7IqW4@vger.kernel.org
X-Gm-Message-State: AOJu0YwRrD2q7IxIHV4NjtfHr/De5VqX3D83zY0hELtVy6o6tZmFulws
	41Bf4pB6jHOekshP9hT4/IKXOPmuWC1Y/bx5oRejvc5Al+3O08baQ2OkvaCUITsh16ObVUVk55t
	8iVvFK6xDlA==
X-Gm-Gg: ASbGncuW7Y9vOXVRE8TnWxbiMBrjOJqc2oLJwdT+SHKfrS7sf7YVHD2ij/ITITCYt+g
	gHgFFvD6nA6ict/0PUU714LIdlyHh+39i+0Ph6HIWkHD3lQVAMtTOQ9wpoAKaEXCqTarglNtpgL
	Pnth9pMZw5PsN5aCl2+R/axYkcgMzDe11s+ExMv/gNDNZUvpMUA0P6OOANt2GVH0mb62J9Izgrw
	uyDAlKHNhRPoBGKUA+y14HXj2W/04KU8OBth1RS8LQ6GZ677fnT29/fpZE09wcgPoqvzCthMNus
	LermzIjCXqlpy5G6Akm8AdYMCA39Cp6TUHMbv2F9DAxfG2GBA4HdnJd6DnL7+9LRKE0FRidvhd+
	hJrp94SgJ/919LTYw37BZiESIVksFHcipjlBvSnsZacFzJTYjx8GLsf2focy4RX5GUjAGstnH5t
	TzdI0C8jQFGSqZzPxPI/JK2hju5TqCGmQlmwlHVTT/wdL/Iyi/X2pho0//R0fe
X-Google-Smtp-Source: AGHT+IECF4/exoZqzbhRoC7QSR0Gi6UkqijhTsu9kgw8khTavWZN/TD9zQN1aQ9nwc67lCpCdo4FqQ==
X-Received: by 2002:a17:907:7e94:b0:b71:8448:a8dd with SMTP id a640c23a62f3a-b7a2474fc23mr127612066b.31.1764984769402;
        Fri, 05 Dec 2025 17:32:49 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4a558b3sm512124566b.69.2025.12.05.17.32.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 17:32:48 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so4325302a12.1
        for <linux-next@vger.kernel.org>; Fri, 05 Dec 2025 17:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWHn267x4OhiQMjp8ncxBuKmypXNg8BE7INnhrJnHEiB7a0Y9uME+r9CoK/PxSDv15LmKTWao9k9gS@vger.kernel.org
X-Received: by 2002:a05:6402:2694:b0:63c:eb6:65e8 with SMTP id
 4fb4d7f45d1cf-6491ade9325mr748559a12.30.1764984767729; Fri, 05 Dec 2025
 17:32:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205111942.4150b06f@canb.auug.org.au> <aTIwhhOF847CcQGl@kernel.org>
 <64034c4b052649773272c6fa9c3c929e28ecd40d.camel@kernel.org> <aTN6d0Qkh3WKt796@kernel.org>
In-Reply-To: <aTN6d0Qkh3WKt796@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 5 Dec 2025 17:32:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh58ZKQTC1iogoMy+Rj+gOuSQM_r2jT3NKD_jiiLyvU8Q@mail.gmail.com>
X-Gm-Features: AQt7F2pT-Vjocf-DHhK60Z-euiFVzVF-nK7kKTkBpeaXu3ebyxYzh2idgSlRfKU
Message-ID: <CAHk-=wh58ZKQTC1iogoMy+Rj+gOuSQM_r2jT3NKD_jiiLyvU8Q@mail.gmail.com>
Subject: Re: [6.19 PATCH] nfs/localio: fix regression due to out-of-order
 __put_cred [was: Re: linux-next: manual merge of the nfs tree with Linus' tree]
To: Mike Snitzer <snitzer@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-nfs@vger.kernel.org, 
	linux-stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 16:36, Mike Snitzer <snitzer@kernel.org> wrote:
>
> Or Linus picks up my patch directly but first adjusts its tags?

Let me do that once I finish my "merge various architecture updates".
I'm almost done with that side - just one more SoC pull to go, I htink
- and can go back to looking at filesystem changes.

             Linus

