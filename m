Return-Path: <linux-next+bounces-5252-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4D4A16403
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2025 22:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B18C1884F6E
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2025 21:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C839188580;
	Sun, 19 Jan 2025 21:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="gP7i/QCe"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7252EB1D;
	Sun, 19 Jan 2025 21:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737322488; cv=none; b=n+QdH01F2CqcVx6OsOo8/IOwFy2OZm+VDcQHrdiAujOOQa3iMmZvi2eXNjUfUvRPOqhOW3VT69mPJ51qCkQvusrNBw/s87+1o1I4aV7LZUTFi+ACI8Vi9TvUixn4EgOjxVXIP7LcEkIl5RyCbxn09I/WpWDUhxfRFmBcVG4qQ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737322488; c=relaxed/simple;
	bh=eVedvpYvy2V41Ywpad5BmkqFINYEb1v9GQcQLK/PtM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2Lht3zeY8sFkgW3ePVGQgESoEEDtjze+vIpu5Kq+vgDo6RliC10U/y5SrHVy56wrEl947fEz8bRj2jUCorMtnNHOpKDTaPGixzeDlpu7i+QW4Ojmy8zMx4KTPzOmvtmOasEBRJ7CH4dlzWaUIrdpwQI46hwQ4oLYyiFXdhgMeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=gP7i/QCe; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737322483; x=1737927283; i=deller@gmx.de;
	bh=9If28D3LQF4miSzNXBWRYJy/qAuGVh+kJVEAwlLMIgI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gP7i/QCe4TMquDc7mbT7LuEmd+bxIhANz51xQ6J9GiUK+++Rt0b+zXqRFc9yX6vG
	 3IYZKSLP2RjKZQPtYJ0Hu2Oi8lbVcDJ53iuDQC7T3Mb0CwlQhoviwr37XZqyu5FGt
	 aAL/5w+jBMBkTu53dusele6T6AAQzzNMc9/pjDGl2Z/q0aZxiK8Al8E8OalfQE+19
	 ITBty3Lpt8fM4z44oBW2ESlf55glbsrNCPtOUROg3U6KK98/+ojVXbxJDung75dFe
	 QPqRRijO5suy+Uhs+/Ne7bRtQLpVFZ4e9oKgrhivMhEyNjn6+GosOMB2+rCcJ8OZT
	 Ep9JTyrAq/PtIttKhw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.6]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwfWa-1tKquP1Lty-016eEH; Sun, 19
 Jan 2025 22:34:43 +0100
Message-ID: <775890c2-65c7-450a-a505-533b38bd0973@gmx.de>
Date: Sun, 19 Jan 2025 22:34:39 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the fbdev tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Soci/Singular <soci@singularcrew.hu>, Zsolt Kajtar <soci@c64.rulez.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250120081256.2b7a018a@canb.auug.org.au>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250120081256.2b7a018a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lrCcaUn51Cof4nlvzs81/5hBYoVqD9SdFelcSvdLiCVHOLGGh3V
 2d8vjLnlBWnfZoumY8XglI6o7bmX49VxfV/Z4emp7hirpTX+sl0+EfDpsIMVza0TGSJMA3h
 b3orLVwQACJmfNfDREID8Ld5GVWlXFlnFcFBQOjmso31UQxcmO3HdMozQXH4Ll0k+PcHd3d
 e4f+jwzPigmOL/sE5xiow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uNia7c4PE4o=;BfEgzmNqeq797kGlX1HF/y/rNx8
 4jiTMRW7OQ914fjE+gxbquRt30VOLWWGMj0r0qEfVEmN1/LntoVK3hp6rD1DDlNTGe/KRm9H6
 73djtKVktOSlImNFC1/bmu8zVlKP8korGEyqJedSCvyfC8iroRyP6QUOizLk95XMlbXlYzo05
 GcXKE5mwg1bH3PlD6ntuWUY+UoWj7fx0POpSqGArY27ciTK3X0jq20r13UmdyaWqb9i9EQo9M
 9YF3Llv5nKKZ+dJ0NqfQsRUL5ytxr+DDPdnAGlm1bMJR1hRdesrW5jpYoZ5khu6a58BlE6gGn
 Lvi/+W3OXpPwgiY4FgmCT5e8AVJm2SX2vi5yMcBdaNmFbhNn6FkAjrZddYxaAlf3F75h9zZc+
 rRg2sgBbAXFdMuN/Cnq6C0msrGVGWaPjCv94c0GQcGl1lVE5yFIYFjJpgrU6hCnvoBrYYm68p
 4rJ83l281xEPS0g8WwM0Pin1b8J1tCbw0/u4rnV4r8hnaazB5sZB1Uhk57bmd+aQRQcRwtSHR
 RVMgHYuOQhz4fVoEMTj9SErkEVCVCSsxTxcAWLm4FSVb/kC2HE4f34FrjPjpzJLVCVC5O/If/
 3JXRIem7MgPg4rle27COQX7xQCUWjwX24hs5tdKfq3OzHIfaEh5nfzTSjdfMe+4AoFHFbDkHG
 +UFmybHurTNB6TR9dsUcL6hSkD1h36aWnNOxk7p0VihdfYOigCcuSzx+jm3v6iy+vZVQf1blq
 oDs8PNiZgCNnPFaks+r4ephovAYYjS0Su6l6bq9F4yTLF/vuYuVfq2/eFnl4oV7BeO4sr7IsR
 gEgCjG+ybhJzjxJN1O/cWzojTXAmI7ojJrw38PWFyTQpk5E3j2D/PHwjYbsKInqpcCEHksshN
 xnZByYMpjRHeJ9U2qSy3eES3xF/22rPcGqZlmtSOGr0Asvuz/WAkHJ2OT5zGmrnNfyDPybBEO
 NghuHeS3y6pmFbvmPm5rJQ0LDMFDQZu0nEs1YFCk5AvXpJ/+EmAOw//Es0rodlfw8Q0vrR8yj
 mhkwntcpKZTq8H/w8K+lFA+r05TqC8GGruOtO8NyFcbvIeWVjmU+/ukxk8/jQ1jYwwZL5Lexg
 7g+tROpVI7fR0Efs5GV9DNT03+bmGUJns1DOGSUkkMYD19c/Vklzf5tkgsVg9YTNW9D2hLqp6
 TfUK/2lUl/U4Jrahi6ZLPICkp6OT7EYaWt39Q8VKNpw==

On 1/19/25 22:12, Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>    d57e1961cb58 ("fbdev: vga16fb: fix orig_video_isVGA confusion")
>
> is missing a Signed-off-by from its author.

Fixed now.

Thanks!
Helge

