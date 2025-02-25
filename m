Return-Path: <linux-next+bounces-5567-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F5A44B5F
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 20:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 889547A3E35
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 19:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CADF1990A2;
	Tue, 25 Feb 2025 19:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="05XqCl7+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/sjWN9Sc"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8812219C54E;
	Tue, 25 Feb 2025 19:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740511953; cv=none; b=m+PMS4zYPt2q9S8U658ybUXwWKuzLvEAjHQA/ClzbF4glvB1H87cdVrI77u2f3gTcuCJ/g+LukAOdR3YKY1rJ0KGFFuBlmPaNArTBED6zHTQmcr+5G+Pb1xc9hc6/VWZLwCOP8PDy72l2WgJvowCYvoG9LneJknSzEaMOjqs5dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740511953; c=relaxed/simple;
	bh=7iwwXU581HFoOelmrhDURpbOv86LLeA6R9xvq5cHtJM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PxhpAfJshm1QOAUgT0lfWP7mgclNdD0618woM8/Msj5U1VC5ScAwUqGhVpJ7RjA4/W/S2s2JBV4m7cf8+Ep3LrydlWU9CGXAHRJKemfHj8/ODxF3PrW22ZJ11lgK1IzqU2pJCQ89gR9KhQlTPBZnk2rQbaYqbglVpruvbvSgQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=05XqCl7+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/sjWN9Sc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740511949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1jrPjukilEBv/hCspf7pK3WQBodfY1qOus5kpYrl0A=;
	b=05XqCl7+rroFfSpzh8rf4lEoVqW0KOrVtQmsUKdcI+0vaGI3amHZq400VzX2W3yvjNMwRd
	bPtU/L04nopm6KxKxuy/SQZMIjscGMbJY61TuUmfbCR2esFtqbjxOdvnCDiKDOkc2SV//F
	4ClJWH1R8cZ30NMTn5zlh3IqGnVuSK1FVLGj6d0fanW2OZeo1qkG4YgkGG/o7hSBHOrmTx
	NG9kmfk08VqfnCxqGPrMD0JWrSyc8iNdbrwxKQZSd/a8ZF2UO/tc25GVNRC5MgcpJC+60b
	A8jqai7VPjn6024cOpdj5cQ3/qGVvrb/mNo2EO2Je7yEA/6iY8RG7QaGnIrOqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740511949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1jrPjukilEBv/hCspf7pK3WQBodfY1qOus5kpYrl0A=;
	b=/sjWN9ScmJcMJ5ahcCAfCkCpsCMbrvLAHIGJVEjuMzmC6vZx80GwfZ/wTkh3kQjDCd396H
	1tiPFTwUhJ87RhDA==
To: John Garry <john.g.garry@oracle.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the tip tree
In-Reply-To: <a902ea86-132a-4b64-8710-575a798f1a18@oracle.com>
References: <20250225153200.00773d86@canb.auug.org.au>
 <a902ea86-132a-4b64-8710-575a798f1a18@oracle.com>
Date: Tue, 25 Feb 2025 20:32:28 +0100
Message-ID: <87h64hg6r7.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 25 2025 at 09:38, John Garry wrote:
> On 25/02/2025 04:32, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>> 
>>    drivers/scsi/scsi_debug.c
>> 
>> between commit:
>> 
>>    b7011929380d ("scsi: Switch to use hrtimer_setup()")
>> 
>> from the tip tree and commit:
>> 
>>    b441eafbd1eb ("scsi: scsi_debug: Simplify command handling")
>> 
>> from the scsi-mkp tree.
>> 
>> I fixed it up (I think - see below) and can carry the fix as necessary.
>> This is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>> 
> static int sdebug_init_cmd_priv(struct Scsi_Host *shost, struct 
> scsi_cmnd *cmd)
> {
> 	struct sdebug_scsi_cmd *sdsc = scsi_cmd_priv(cmd);
> 	struct sdebug_defer *sd_dp = &sdsc->sd_dp;
>
> 	spin_lock_init(&sdsc->lock);
> 	hrtimer_setup(&sd_dp->hrt, sdebug_q_cmd_hrt_complete, CLOCK_MONOTONIC,
> 		      HRTIMER_MODE_REL_PINNED);
> 	sd_dp->hrt.function = sdebug_q_cmd_hrt_complete; ***
> 	INIT_WORK(&sd_dp->ew.work, sdebug_q_cmd_wq_complete);
>
>
> I guess that setting sd_dp->hrt.function explicitly, at *** above, is 
> not needed (as hrtimer_setup()) does this.

Correct. hrtimer_setup is enough.

Thanks,

        tglx

