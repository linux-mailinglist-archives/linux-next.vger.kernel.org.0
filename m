Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82CFDFE296
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 17:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfKOQTy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 11:19:54 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:43654 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfKOQTy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Nov 2019 11:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=MihLrs/7FogrHpnKneeCp+h+sbBa6r5+J8efbKThpOI=; b=vDSU1ZK3jFr3QP3fGfLx3qkbl
        WwMuqlIsGri1tAkLsVtK+irkl8NqY57I/N20jwPd70dl4IvCbvoNOyq1Qbfqa+gFdq5mR+MT5BHl/
        YND/BICyPvw9qkWWLoA6oj/FX9Rpe0Sa23XncCZmjZB1j9wP4aBIH3KB8b3PxqmrPPt1TTOTxvpzL
        /I1zB9kOH0Ij+gpP/JxCZ5Sx8B7m46pE9wqqXgLpgMvXbHuym536g+o+Z2PN6T9PMbTy7FoLoPmR/
        G+QOCHC9Vvyic9H9AiXT0tnqm0BPPPhOiSZj6acoryxqxAiwpBnIckuUpUb6p2sAoeF/AOTBIbNHM
        6tqUnnY8w==;
Received: from [2601:1c0:6280:3f0::5a22]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iVeKA-0002p8-4s; Fri, 15 Nov 2019 16:19:54 +0000
Subject: Re: linux-next: Tree for Nov 15 (drivers/md/dm-integrity)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
References: <20191115190525.77efdf6c@canb.auug.org.au>
 <f368f431-b741-d04f-440b-3d8c3c035537@infradead.org>
Message-ID: <d3a96436-0d9c-a13f-7524-33b203910367@infradead.org>
Date:   Fri, 15 Nov 2019 08:19:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f368f431-b741-d04f-440b-3d8c3c035537@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/15/19 8:17 AM, Randy Dunlap wrote:
> On 11/15/19 12:05 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20191114:
>>
> 
> on i386:
> 
> ld: drivers/md/dm-integrity.o: in function `calculate_device_limits':
> dm-integrity.c:(.text.unlikely+0x1e9): undefined reference to `__udivdi3'
> 
> 

BTW, dm-devel@redhat.com seems to be invalid or dead.

so adding Alasdair and Mike.

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
