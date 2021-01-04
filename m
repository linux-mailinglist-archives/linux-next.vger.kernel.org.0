Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F29D2E9CF3
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 19:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbhADSVu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 13:21:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25731 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726599AbhADSVu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2021 13:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609784423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m5lRV7vrEVGp1l9C3/Y3CacxbQU7bdUKQ6F623/ETQs=;
        b=EuYW63el+OFSH3TsnannzfVoL8otIq0/EEaCWsGGenR7oT+QkpuAiWzD1IV6QOudA5HzU9
        iEy5UkCUxNOpsdZcyRjTz/ABoRqGdNWO/fT7+cz8D/qR1cdqH+ecHd/VyvjDhOhGeNxxUO
        cUO2cF5CxaoeG9j3jkFgiZirwYZjUn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-0wI8nRrnMJaPayA29BK_kQ-1; Mon, 04 Jan 2021 13:20:19 -0500
X-MC-Unique: 0wI8nRrnMJaPayA29BK_kQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF471107ACE3;
        Mon,  4 Jan 2021 18:20:17 +0000 (UTC)
Received: from ovpn-66-203.rdu2.redhat.com (unknown [10.10.67.203])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9E62971C8F;
        Mon,  4 Jan 2021 18:20:16 +0000 (UTC)
Message-ID: <a0fcd5a4a595deddd990a6327568c82a1e94948a.camel@redhat.com>
Subject: Re: [PATCH] KVM: arm64: Don't access PMCR_EL0 when no PMU is
 available
From:   Qian Cai <qcai@redhat.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        kernel-team@android.com, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Alexandru Elisei <alexandru.elisei@arm.com>
Date:   Mon, 04 Jan 2021 13:20:16 -0500
In-Reply-To: <bd725a533e4754b0d5634574bcab4b0d@kernel.org>
References: <20201210083059.1277162-1-maz@kernel.org>
         <703e1b5f2db1631e8f9c55619909fe66eb069f25.camel@redhat.com>
         <579c839a0016107af66e704f147f9814@kernel.org>
         <f4300d00b9d2540bf90a6b1baadf030a2e4c92ed.camel@redhat.com>
         <bd725a533e4754b0d5634574bcab4b0d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2021-01-04 at 16:27 +0000, Marc Zyngier wrote:
> On 2021-01-04 16:22, Qian Cai wrote:
> > On Mon, 2021-01-04 at 16:08 +0000, Marc Zyngier wrote:
> > > On 2021-01-04 15:47, Qian Cai wrote:
> > > > On Thu, 2020-12-10 at 08:30 +0000, Marc Zyngier wrote:
> > > > > We reset the guest's view of PMCR_EL0 unconditionally, based on
> > > > > the host's view of this register. It is however legal for an
> > > > > imnplementation not to provide any PMU, resulting in an UNDEF.
> > > > > 
> > > > > The obvious fix is to skip the reset of this shadow register
> > > > > when no PMU is available, sidestepping the issue entirely.
> > > > > If no PMU is available, the guest is not able to request
> > > > > a virtual PMU anyway, so not doing nothing is the right thing
> > > > > to do!
> > > > > 
> > > > > It is unlikely that this bug can hit any HW implementation
> > > > > though, as they all provide a PMU. It has been found using nested
> > > > > virt with the host KVM not implementing the PMU itself.
> > > > > 
> > > > > Fixes: ab9468340d2bc ("arm64: KVM: Add access handler for PMCR
> > > > > register")
> > > > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > > 
> > > > Reverting this commit on the top of today's linux-next fixed a qemu-kvm
> > > > coredump
> > > > issue on TX2 while starting a guest.
> > > > 
> > > > - host kernel .config:
> > > > https://cailca.coding.net/public/linux/mm/git/files/master/arm64.config
> > > > 
> > > > # /usr/libexec/qemu-kvm -name ubuntu-20.04-server-cloudimg -cpu host
> > > > -smp 2 -m 2g
> > > > -drive
> > > > if=none,format=qcow2,file=./ubuntu-20.04-server-cloudimg.qcow2,id=hd
> > > > -device virtio-scsi -device scsi-hd,drive=hd -cdrom
> > > > ./ubuntu-20.04-server-cloudimg.iso
> > > > -bios /usr/share/AAVMF/AAVMF_CODE.fd -M gic-version=host -nographic
> > > > -nic user,model=virtio,hostfwd=tcp::2222-:22
> > > > 
> > > > qemu-kvm: /builddir/build/BUILD/qemu-4.2.0/target/arm/helper.c:1812:
> > > > pmevcntr_rawwrite: Assertion `counter < pmu_num_counters(env)' failed.
> > > 
> > > You don't have KVM_ARM_PMU selected in your config, so QEMU cannot
> > > access the PMU registers, and no counters are exposed.
> > 
> > Well, isn't it the rule that don't break the userspace? qemu works fine 
> > with
> > KVM_ARM_PMU=n until this commit.
> 
> No, it doesn't "work fine". It gets random data that potentially makes 
> no sense,
> depending on the HW this runs on.
> 
> Now, userspace tells you that your kernel is misconfigured. I see it as
> an improvement.

Marc, do you suggest that CONFIG_KVM=y should select KVM_ARM_PMU=y then?
Otherwise, this is rather difficult for users to figure out and a core dump with
an implicit error message from qemu is not that helpful.

