Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F950112FDD
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2019 17:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728618AbfLDQUf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Dec 2019 11:20:35 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:57052 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfLDQUf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Dec 2019 11:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=UlzRRWNwiQzLelHuY1Hwa0hkmOKJfcQsspUvSd31HbY=; b=sWjyWOy5c7c4+1BFcfpb3Jvd0
        A4xD1usBzr+fSbuzXlnRTIUjBGObXY38syfJXxaHwQoAYu2GthAUefXyxppn/d6KmaMilbbD5RsWk
        m1aO1n2vXXEDsEcxIlvLLVE5WQ1FOYhClzKMN2y+nWo1Qg8EhhvcqdfhcapdZ+SFkqbc0mwVrhpgU
        h/Sfrf7qdLqrUSGrmBlgehbFU/Ei8dA/76qyhtM/feasK78ohc1XA9pujRcezk1hkVLYlbD51E+bE
        36/C/QnVAL+OMc5PFeHhkkBWeO2Ll3kiB/63xLEUz58nrUebTzlfdiyV3RZjGUjVTbIC7S2Tc8A0P
        1s05BW2Uw==;
Received: from [2601:1c0:6280:3f0::3deb]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1icXOD-0008RH-Ic; Wed, 04 Dec 2019 16:20:33 +0000
Subject: Re: linux-next: Tree for Dec 4 (objtool)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20191204160658.64a3dd1c@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <96ecee4e-a1a0-b3d6-8700-26dabbb364ef@infradead.org>
Date:   Wed, 4 Dec 2019 08:20:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191204160658.64a3dd1c@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/3/19 9:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material for v5.6 to your linux-next included
> trees until after v5.5-rc1 has been released.
> 
> Changes since 20191203:
> 


on x86_64:

drivers/pinctrl/pinctrl-ingenic.o: warning: objtool: ingenic_pinconf_set() falls through to next function ingenic_pinconf_group_set()


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
