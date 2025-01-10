Return-Path: <linux-next+bounces-5145-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3A8A08E2B
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 11:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B98DC169E46
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 10:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154E420A5CC;
	Fri, 10 Jan 2025 10:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3UlC60K"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E94F20ADC9;
	Fri, 10 Jan 2025 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505521; cv=none; b=fXUXfB2YdF3hsRgxDNiSaCo5e0N/2SgUVXu4n8jfVt9M0yyETLchy+wVd0plSRsN/3/Rgn45I5QCt7fBOzfe3S2kbVbB0SmKulmbREyF4U6+gJQW/qr70s2+GPIkXfXLvkbF0CQ0pMxvfYQkkxm2yo1+E8Ymo4q92JZvyHTUgV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505521; c=relaxed/simple;
	bh=4aUB/CtZWH1k+T3LrjaJXALwOydI7EUwEjf0vTAHoyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mqr8s45865RRC6K/FFyftc8KUvnIZmUWcwZUz2ONNj5tsJd//IICtmAGq6dn/7rBM1Qv+UZTuyVde8IutMmQKfNtL6lwb6L/HZB7Q8qf9nFogaRBha6Z1G+Du/KkHCvye5YV/rC76fZeSK040Ga9HlnK2Edu2/hHTAQ0zypkQzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3UlC60K; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so373143a91.0;
        Fri, 10 Jan 2025 02:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736505520; x=1737110320; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4aUB/CtZWH1k+T3LrjaJXALwOydI7EUwEjf0vTAHoyY=;
        b=K3UlC60K0hx0qIplJ59tYQGwLcbr/ENFtk7H2PkuYDb73cNbw18o9e9m4lEnmccYh5
         4VpCo0x3FG7wY2Idd/EYEGLHdp8Tlek6MsKUTC8QbIOR/Bq3T2j1hxeYvW2iqHGRScot
         XdbkC8GNoNndC9G4tiOJeEIhpMdCqE5j8mqD8Iesd8uOgoIsjp5OZQN10vkT3C7oJkp+
         jm7FPDPMDpQmWQs5zpjUD378Kh63mO1FC5GaWbdtX4Pwnxs/k5HMGSKK989ywF69uV6r
         F0xPtsWPQ1kYUiM58D1frM0gRuGXwT0tzMcI7ApqFfYGhOa3P3uGYhEY+tqbk6IQ0lE5
         /S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736505520; x=1737110320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aUB/CtZWH1k+T3LrjaJXALwOydI7EUwEjf0vTAHoyY=;
        b=FkHJRWO4mjGsfjCjgzXoZi4hZWb50YW54sZz0xZxPRMpPiwlIkgdjorCsXYqGijiuO
         8c687BDupbmO4SPS8hCvttwC8iXPsGFs3TeHnjJTled7q8yZ6HHhBqi+PQRMOpkyypeo
         u/TE9SxXzQVIUrUSb0Bb+arSm86oVPwobRdPEZ4fFJ31BB2GOeqCxzAsJrNsvs3s+IM/
         L9VekDqwfuEZfo0XxH+RygNw7XnQho9APdLdJ0E3ihKbQe1B/IJpCaej4MVe+Il8Q4mR
         EKOux40oX3uuboNwbxQoF3GYvQ2Xv55CeEQjzYcvAmX67cuhnXDgEgofGbUv2CxZ646K
         s12g==
X-Forwarded-Encrypted: i=1; AJvYcCUw32betVKUbl/Fcr0MtROJlW6tBWpOgAMzYoTFdcagNCdQaGAJeuG1QHsS8reziqWr1oDdardr3wDRnQ==@vger.kernel.org, AJvYcCWvUmkRGk7wrPcG1O7Dt7USsRqTfS7TxC8T/wEiBDqkFW815zcFlfpU1767tQPOYy+qkRKGzuboLakohPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvaRi2hM6khEofld4UYwRjmyg5enzUj+jIIa4DSSR9jrya01hm
	F6fsKHRZ875ipSeanQzlwQfT7SvIayG73MAv6Br9p8wJBY5oQfZbC28GPkp88cuEbK/jmXYnfgn
	7wyqmtxXqG4iyLcv9ytUHUMzpj5Yr5kbU
X-Gm-Gg: ASbGncsTR4dpgND4K4hIcacehUOGRUE2yfpjibXU2nxvKUR+eLTAB/kmZnLzfLSYV8p
	qiK3DUNRj3Gljb7C/5SHanjZC4ZRVMnwx7oEXdQ==
X-Google-Smtp-Source: AGHT+IE4KRhoQSyL68MneniPJn4RdUsFmqiqHKGrCQFoxF24ur0IazOjpZ2XEBlltDwGJKJhTFf1cdoAoeMQuaA1FTU=
X-Received: by 2002:a17:90a:c2c8:b0:2ee:6db1:21dc with SMTP id
 98e67ed59e1d1-2f548ea2bffmr5397559a91.1.1736505519859; Fri, 10 Jan 2025
 02:38:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110162828.38614c1b@canb.auug.org.au> <CAH5fLggV5QC53u9xypFga4yheem+7vO=fNqLE47zRj=t_H8eYg@mail.gmail.com>
 <2025011024-clean-refold-b170@gregkh> <CANiq72=zO_Grb-eX6SYxPrQszksgfe8Lfg35Ee49kFgBVFWRvA@mail.gmail.com>
In-Reply-To: <CANiq72=zO_Grb-eX6SYxPrQszksgfe8Lfg35Ee49kFgBVFWRvA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jan 2025 11:38:27 +0100
X-Gm-Features: AbW1kvb-I6cQd6b31suM5f9e96jVUgGOqrygAQkkkfs-P9dOFQUTJ5Hk6hALW-w
Message-ID: <CANiq72kp4MLPT7seBveR_ZdNMq5UmJpLaQ8ctz0At7TxkD8KBg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000a98967062b57b2fe"

--000000000000a98967062b57b2fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 11:16=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> independent cleanup to the tree, I guess. In that case, I would clean
> the 3 cases (i.e. adding `!` but not removing `kernel::`).

The patch that Alice sent for this looks good.

Stephen: I did a quick build test with a merge with `rust-next` using
the following resolution (attached).

Cheers,
Miguel

--000000000000a98967062b57b2fe
Content-Type: application/x-patch; name="driver-core-next_rust-next.diff"
Content-Disposition: attachment; filename="driver-core-next_rust-next.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m5qmgmo90>
X-Attachment-Id: f_m5qmgmo90

ZGlmZiAtLWNjIHJ1c3Qva2VybmVsL2xpYi5ycwppbmRleCBiMTFmYTA4ZGUzYzAsNjA2M2Y0YTNk
OWMwLi4yZDVjM2Q3ZDJlMjEKLS0tIGEvcnVzdC9rZXJuZWwvbGliLnJzCisrKyBiL3J1c3Qva2Vy
bmVsL2xpYi5ycwpAQEAgLTM3LDEyIC0zMiwxMCArMzcsMTMgQEBAIHB1YiB1c2UgZmZpCiAgcHVi
IG1vZCBhbGxvYzsKICAjW2NmZyhDT05GSUdfQkxPQ0spXQogIHB1YiBtb2QgYmxvY2s7Ci0gbW9k
IGJ1aWxkX2Fzc2VydDsKKyAjW2RvYyhoaWRkZW4pXQorIHB1YiBtb2QgYnVpbGRfYXNzZXJ0Owog
IHB1YiBtb2QgY3JlZDsKICBwdWIgbW9kIGRldmljZTsKICtwdWIgbW9kIGRldmljZV9pZDsKICtw
dWIgbW9kIGRldnJlczsKICtwdWIgbW9kIGRyaXZlcjsKICBwdWIgbW9kIGVycm9yOwogICNbY2Zn
KENPTkZJR19SVVNUX0ZXX0xPQURFUl9BQlNUUkFDVElPTlMpXQogIHB1YiBtb2QgZmlybXdhcmU7
CmRpZmYgLS1jYyBydXN0L2tlcm5lbC9taXNjZGV2aWNlLnJzCmluZGV4IGRmYjM2MzYzMGM3MCw5
ZTFiOWMwZmFlOWQuLjNiYTAxODY1MWJjMAotLS0gYS9ydXN0L2tlcm5lbC9taXNjZGV2aWNlLnJz
CisrKyBiL3J1c3Qva2VybmVsL21pc2NkZXZpY2UucnMKQEBAIC0xMCwxMSAtMTAsOSArMTAsMTIg
QEBACgogIHVzZSBjcmF0ZTo6ewogICAgICBiaW5kaW5ncywKICsgICAgZGV2aWNlOjpEZXZpY2Us
CiAgICAgIGVycm9yOjp7dG9fcmVzdWx0LCBFcnJvciwgUmVzdWx0LCBWVEFCTEVfREVGQVVMVF9F
UlJPUn0sCisgICAgIGZmaTo6e2NfaW50LCBjX2xvbmcsIGNfdWludCwgY191bG9uZ30sCiArICAg
IGZzOjpGaWxlLAogICAgICBwcmVsdWRlOjoqLAogKyAgICBzZXFfZmlsZTo6U2VxRmlsZSwKICAg
ICAgc3RyOjpDU3RyLAogICAgICB0eXBlczo6e0ZvcmVpZ25Pd25hYmxlLCBPcGFxdWV9LAogIH07
CkBAQCAtMTUxLDE3IC0xMzIsOCArMTQ3LDE3IEBAQCBwdWIgdHJhaXQgTWlzY0RldmljZTogU2l6
ZWQKICAgICAgICAgIF9jbWQ6IHUzMiwKICAgICAgICAgIF9hcmc6IHVzaXplLAogICAgICApIC0+
IFJlc3VsdDxpc2l6ZT4gewotICAgICAgICAga2VybmVsOjpidWlsZF9lcnJvciEoVlRBQkxFX0RF
RkFVTFRfRVJST1IpCisgICAgICAgICBidWlsZF9lcnJvciEoVlRBQkxFX0RFRkFVTFRfRVJST1Ip
CiAgICAgIH0KICsKICsgICAgLy8vIFNob3cgaW5mbyBmb3IgdGhpcyBmZC4KICsgICAgZm4gc2hv
d19mZGluZm8oCiArICAgICAgICBfZGV2aWNlOiA8U2VsZjo6UHRyIGFzIEZvcmVpZ25Pd25hYmxl
Pjo6Qm9ycm93ZWQ8J18+LAogKyAgICAgICAgX206ICZTZXFGaWxlLAogKyAgICAgICAgX2ZpbGU6
ICZGaWxlLAogKyAgICApIHsKLSAgICAgICAgIGtlcm5lbDo6YnVpbGRfZXJyb3IhKFZUQUJMRV9E
RUZBVUxUX0VSUk9SKQorKyAgICAgICAgYnVpbGRfZXJyb3IhKFZUQUJMRV9ERUZBVUxUX0VSUk9S
KQogKyAgICB9CiAgfQoKICBjb25zdCBmbiBjcmVhdGVfdnRhYmxlPFQ6IE1pc2NEZXZpY2U+KCkg
LT4gJidzdGF0aWMgYmluZGluZ3M6OmZpbGVfb3BlcmF0aW9ucyB7CkBAQCAtMjc0LDEyIC0yMjUs
NyArMjcwLDEyIEBAQCB1bnNhZmUgZXh0ZXJuICJDIiBmbiBmb3BzX2lvY3RsPFQ6IE1pc2MKICAg
ICAgLy8gU0FGRVRZOiBJb2N0bCBjYWxscyBjYW4gYm9ycm93IHRoZSBwcml2YXRlIGRhdGEgb2Yg
dGhlIGZpbGUuCiAgICAgIGxldCBkZXZpY2UgPSB1bnNhZmUgeyA8VDo6UHRyIGFzIEZvcmVpZ25P
d25hYmxlPjo6Ym9ycm93KHByaXZhdGUpIH07CgogLSAgICBtYXRjaCBUOjppb2N0bChkZXZpY2Us
IGNtZCwgYXJnKSB7CiArICAgIC8vIFNBRkVUWToKICsgICAgLy8gKiBUaGUgZmlsZSBpcyB2YWxp
ZCBmb3IgdGhlIGR1cmF0aW9uIG9mIHRoaXMgY2FsbC4KICsgICAgLy8gKiBUaGVyZSBpcyBubyBh
Y3RpdmUgZmRnZXRfcG9zIHJlZ2lvbiBvbiB0aGUgZmlsZSBvbiB0aGlzIHRocmVhZC4KICsgICAg
bGV0IGZpbGUgPSB1bnNhZmUgeyBGaWxlOjpmcm9tX3Jhd19maWxlKGZpbGUpIH07CiArCi0gICAg
IG1hdGNoIFQ6OmlvY3RsKGRldmljZSwgZmlsZSwgY21kLCBhcmcgYXMgdXNpemUpIHsKKysgICAg
bWF0Y2ggVDo6aW9jdGwoZGV2aWNlLCBmaWxlLCBjbWQsIGFyZykgewogICAgICAgICAgT2socmV0
KSA9PiByZXQgYXMgY19sb25nLAogICAgICAgICAgRXJyKGVycikgPT4gZXJyLnRvX2Vycm5vKCkg
YXMgY19sb25nLAogICAgICB9CkBAQCAtMjk5LDEyIC0yNDUsNyArMjk1LDEyIEBAQCB1bnNhZmUg
ZXh0ZXJuICJDIiBmbiBmb3BzX2NvbXBhdF9pb2N0bDwKICAgICAgLy8gU0FGRVRZOiBJb2N0bCBj
YWxscyBjYW4gYm9ycm93IHRoZSBwcml2YXRlIGRhdGEgb2YgdGhlIGZpbGUuCiAgICAgIGxldCBk
ZXZpY2UgPSB1bnNhZmUgeyA8VDo6UHRyIGFzIEZvcmVpZ25Pd25hYmxlPjo6Ym9ycm93KHByaXZh
dGUpIH07CgogLSAgICBtYXRjaCBUOjpjb21wYXRfaW9jdGwoZGV2aWNlLCBjbWQsIGFyZykgewog
KyAgICAvLyBTQUZFVFk6CiArICAgIC8vICogVGhlIGZpbGUgaXMgdmFsaWQgZm9yIHRoZSBkdXJh
dGlvbiBvZiB0aGlzIGNhbGwuCiArICAgIC8vICogVGhlcmUgaXMgbm8gYWN0aXZlIGZkZ2V0X3Bv
cyByZWdpb24gb24gdGhlIGZpbGUgb24gdGhpcyB0aHJlYWQuCiArICAgIGxldCBmaWxlID0gdW5z
YWZlIHsgRmlsZTo6ZnJvbV9yYXdfZmlsZShmaWxlKSB9OwogKwotICAgICBtYXRjaCBUOjpjb21w
YXRfaW9jdGwoZGV2aWNlLCBmaWxlLCBjbWQsIGFyZyBhcyB1c2l6ZSkgeworKyAgICBtYXRjaCBU
Ojpjb21wYXRfaW9jdGwoZGV2aWNlLCBmaWxlLCBjbWQsIGFyZykgewogICAgICAgICAgT2socmV0
KSA9PiByZXQgYXMgY19sb25nLAogICAgICAgICAgRXJyKGVycikgPT4gZXJyLnRvX2Vycm5vKCkg
YXMgY19sb25nLAogICAgICB9Cg==
--000000000000a98967062b57b2fe--

