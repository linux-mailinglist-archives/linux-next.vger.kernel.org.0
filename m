Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE252E9E38
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 20:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbhADTdY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 14:33:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:57174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726655AbhADTdY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Jan 2021 14:33:24 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3AB9720784;
        Mon,  4 Jan 2021 19:32:43 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kwVar-005IJG-4e; Mon, 04 Jan 2021 19:32:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 04 Jan 2021 19:32:41 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Qian Cai <qcai@redhat.com>
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        kernel-team@android.com, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH] KVM: arm64: Don't access PMCR_EL0 when no PMU is
 available
In-Reply-To: <22cd2b3e8b8b278f110a3540755583efee7189fd.camel@redhat.com>
References: <20201210083059.1277162-1-maz@kernel.org>
 <703e1b5f2db1631e8f9c55619909fe66eb069f25.camel@redhat.com>
 <579c839a0016107af66e704f147f9814@kernel.org>
 <f4300d00b9d2540bf90a6b1baadf030a2e4c92ed.camel@redhat.com>
 <bd725a533e4754b0d5634574bcab4b0d@kernel.org>
 <a0fcd5a4a595deddd990a6327568c82a1e94948a.camel@redhat.com>
 <f7b97771ed29c7630f678a8939a591dd@kernel.org>
 <22cd2b3e8b8b278f110a3540755583efee7189fd.camel@redhat.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <81607700b5de4860a6f281c68ee17669@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: qcai@redhat.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, kernel-team@android.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2021-01-04 18:42, Qian Cai wrote:
> On Mon, 2021-01-04 at 18:26 +0000, Marc Zyngier wrote:
>> What I'm suggesting is this [1], which is to get rid of KVM_ARM_PMU
>> completely. At least, the kernel configuration will be consistent.
>> 
> 
> Do you have a patch for CONFIG_KVM to select HW_PERF_EVENTS then? I 
> could cook
> one if not.

I don't think there should be such a patch. People do disable
HW_PERF_EVENTS in production in some cases, and we should
honor that. All I am trying to guarantee at the moment is
that the KVM configuration is consistent, as I believe that's
what broke in your particular case.

What needs doing is to hide the PMU registers from userspace
when no PMU is configured, or even available. I'll try and post
something to that effect tomorrow (hey, I'm still officially
on holiday...).

         M.
-- 
Jazz is not dead. It just smells funny...
