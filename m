Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EE22E9D46
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 19:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbhADSoF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 13:44:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52483 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726397AbhADSoF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2021 13:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609785759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DKmL21N+iyKhBf8N6rygtnRxpR6MVevdbYR2ogpgY9U=;
        b=bBBKjy83AnQo6ERgOz2uXu6I9iflYSE5xbPyOF9USRSczexRVOvhueWGpnq1fBRAKRVkF/
        Rk1+7SNSct48IAJrzNdLFqk9E7+uui6TGoCaA0nwekNLgJLg/tOKvGsdPKDghq45jn9efM
        op3Q+iSuaGU7vIwN01gqRzsveJ24BdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-0a-1fElvMayIVmgyVXnKvA-1; Mon, 04 Jan 2021 13:42:35 -0500
X-MC-Unique: 0a-1fElvMayIVmgyVXnKvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09817107ACF8;
        Mon,  4 Jan 2021 18:42:33 +0000 (UTC)
Received: from ovpn-66-203.rdu2.redhat.com (unknown [10.10.67.203])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3052B5D751;
        Mon,  4 Jan 2021 18:42:32 +0000 (UTC)
Message-ID: <22cd2b3e8b8b278f110a3540755583efee7189fd.camel@redhat.com>
Subject: Re: [PATCH] KVM: arm64: Don't access PMCR_EL0 when no PMU is
 available
From:   Qian Cai <qcai@redhat.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        kernel-team@android.com, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Alexandru Elisei <alexandru.elisei@arm.com>
Date:   Mon, 04 Jan 2021 13:42:31 -0500
In-Reply-To: <f7b97771ed29c7630f678a8939a591dd@kernel.org>
References: <20201210083059.1277162-1-maz@kernel.org>
         <703e1b5f2db1631e8f9c55619909fe66eb069f25.camel@redhat.com>
         <579c839a0016107af66e704f147f9814@kernel.org>
         <f4300d00b9d2540bf90a6b1baadf030a2e4c92ed.camel@redhat.com>
         <bd725a533e4754b0d5634574bcab4b0d@kernel.org>
         <a0fcd5a4a595deddd990a6327568c82a1e94948a.camel@redhat.com>
         <f7b97771ed29c7630f678a8939a591dd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2021-01-04 at 18:26 +0000, Marc Zyngier wrote:
> What I'm suggesting is this [1], which is to get rid of KVM_ARM_PMU
> completely. At least, the kernel configuration will be consistent.
> 

Do you have a patch for CONFIG_KVM to select HW_PERF_EVENTS then? I could cook
one if not.

> Overall, I think there is an issue with KVM exposing more than it
> should to userspace when no PMU is defined, but I don't think that's
> the problem you are seeing.
> 
>          M.
> 
> [1] https://lore.kernel.org/r/20210104172723.2014324-1-maz@kernel.org

