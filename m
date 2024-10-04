Return-Path: <linux-next+bounces-4111-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE96F9905CA
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 16:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AB77B21976
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 14:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F78381AF;
	Fri,  4 Oct 2024 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="MQBAspra";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="hlFn1pvn";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="MQBAspra";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="hlFn1pvn"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2435D2141A5
	for <linux-next@vger.kernel.org>; Fri,  4 Oct 2024 14:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728051469; cv=none; b=ARoCJhGI1uZIqWAqI444UeNCAEHdVh/LPxH/wVLKoOBXw7r2fS1rdGLu7KzDEwX25kC58ScOVudFuMe7D7gWJ1i0L9HNookr/0A1gjipkxlryH2dcuXOPWYS5OcL7aaGAlMvtLXOlun6g4fdDSkbgIg8hmnzcE2MW3SYwH62QTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728051469; c=relaxed/simple;
	bh=AGQjnI4Opzfiy0y9ifkg4NSfqY7MlxpBWBHdQzfjKNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPxhhQbV1Q0vRD0GeowxljfFjtWsEyhLkeOFBSnWMg/8tvoS5yifpcCAgRr9c1RwTeKdOONeQGsB4/pRUYWOmoEZ3s5hdpLzV1PT0sXI7wAsPeueRmdpAoMSB+g3yqvhnInMJo5h0MCoiVz4n1aOaVND+99LlA0dvUtXdTVwYvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=MQBAspra; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=hlFn1pvn; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=MQBAspra; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=hlFn1pvn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3743621D5F;
	Fri,  4 Oct 2024 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728051465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NAmraRsnX0DGk/kc43LRPTiCABANgNdKItqZgP9meDI=;
	b=MQBAsprairNX/aPwaAzCnxmnHWZDos055QfPrbwO4UJGNqx3Q9I4ljmRatkirYGQjHBG75
	BH51gn0XxQ1G2k6O1X6uwUCLqRx8jPYEgIUSbTmWRan5vwHpzyETfG9LdBZ/QlYtmzaS0w
	4X4gzHHJUCKpMUrsVKGHG3UNKUJN5+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728051465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NAmraRsnX0DGk/kc43LRPTiCABANgNdKItqZgP9meDI=;
	b=hlFn1pvnswFidedCUwlf8hx5GX9iLLRx8rzTpGk9R8CaV62swLrmHotmx0K62hgh6p/wof
	Y7ujZGfn6xfuEXBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728051465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NAmraRsnX0DGk/kc43LRPTiCABANgNdKItqZgP9meDI=;
	b=MQBAsprairNX/aPwaAzCnxmnHWZDos055QfPrbwO4UJGNqx3Q9I4ljmRatkirYGQjHBG75
	BH51gn0XxQ1G2k6O1X6uwUCLqRx8jPYEgIUSbTmWRan5vwHpzyETfG9LdBZ/QlYtmzaS0w
	4X4gzHHJUCKpMUrsVKGHG3UNKUJN5+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728051465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NAmraRsnX0DGk/kc43LRPTiCABANgNdKItqZgP9meDI=;
	b=hlFn1pvnswFidedCUwlf8hx5GX9iLLRx8rzTpGk9R8CaV62swLrmHotmx0K62hgh6p/wof
	Y7ujZGfn6xfuEXBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 274DE13A6E;
	Fri,  4 Oct 2024 14:17:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qjOxCAn5/2YwZQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 04 Oct 2024 14:17:45 +0000
Message-ID: <b922e80a-d0ca-4402-bb7a-9740fda370f3@suse.cz>
Date: Fri, 4 Oct 2024 16:17:44 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING: CPU: 43 PID: 2254 at mm/slub.c:4655
 krealloc_noprof+0x2c7/0x300 with next-20241003
Content-Language: en-US
To: Feng Tang <feng.tang@intel.com>, "V, Narasimhan" <Narasimhan.V@amd.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Borislav Petkov <bp@alien8.de>
References: <DM4PR12MB50866964E5363920F072737589722@DM4PR12MB5086.namprd12.prod.outlook.com>
 <Zv/An5StQOBS7Ais@feng-clx.sh.intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <Zv/An5StQOBS7Ais@feng-clx.sh.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.983];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Flag: NO
X-Spam-Level: 

On 10/4/24 12:17, Feng Tang wrote:
> On Fri, Oct 04, 2024 at 02:22:38PM +0800, V, Narasimhan wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>> 
>> Hi,
>> 
>> Seeing the following bug on boot with next-20241003
> 
> I think it is caused by my commit d0a38fad51cc "mm/slub: Improve redzone check and zeroing for krealloc()"
> that the virt_to_cache() it calls returns NULL
> 
> Could you share your kernel config? Is KFENCE enabled?

I think it might be a large kmalloc(), we have to deal with that as well,
uhh. Calling ksize() did.

> Thanks,
> Feng
> 
>> 
>> 
>> [   22.919976] BUG: kernel NULL pointer dereference, address: 000000000000001c
>> [   22.919976] WARNING: CPU: 43 PID: 2254 at mm/slub.c:4655 krealloc_noprof+0x2c7/0x300
>> [   22.921382] ipmi_si IPI0001:00: IPMI kcs interface initialized
>> [   22.928902] #PF: supervisor read access in kernel mode
>> [   22.928905] #PF: error_code(0x0000) - not-present page
>> [   22.928906] PGD 12e148067 P4D 0
>> [   22.928910] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
>> [   22.928913] CPU: 60 UID: 0 PID: 2258 Comm: apparmor_parser Not tainted 6.12.0-rc1-next-20241003-1727931325865 #1
>> [   22.937555] Modules linked in:
>> [   22.944047] Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100BD 12/11/2023
>> [   22.944050] RIP: 0010:krealloc_noprof+0x8f/0x300
>> [   22.949780]  nls_iso8859_1
>> [   22.955504] Code: 8b 50 08 f6 c2 01 0f 85 14 02 00 00 0f 1f 44 00 00 80 78 33 f5 0f 85 0e 02 00 00 48 85 c0 0f 84 05 02 00 00 48 8b 48 08 66 90 <48> 63 59 1c 41 89 df 4d 39 fd 0f 87 8c 00 00 00 0f 1f 44 00 00 48
>> [   22.955507] RSP: 0018:ff6bbed6c1c0b8e8 EFLAGS: 00010202
>> [   22.955510] RAX: ffe388b6044da000 RBX: 0000000000000001 RCX: 0000000000000000
>> [   22.959108]  amd_atl
>> [   22.964542] RDX: 0000000000000000 RSI: 000000000000183a RDI: ff4164e813680000
>> [   22.964545] RBP: ff6bbed6c1c0b918 R08: 0000000000001833 R09: 0000000000000000
>> [   22.964546] R10: 00000000000050c1 R11: ff4164e81368183a R12: ff4164e813680000
>> [   22.964547] R13: 000000000000183a R14: 0000000000000cc0 R15: ff4164e826800000
>> [   22.964548] FS:  00007f678de21740(0000) GS:ff4164f70d800000(0000) knlGS:0000000000000000
>> [   22.975899]  intel_rapl_msr
>> [   22.979296] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   22.979299] CR2: 000000000000001c CR3: 00000001131e4004 CR4: 0000000000771ef0
>> [   22.979300] PKRU: 55555554
>> [   22.979302] Call Trace:
>> [   22.979303]  <TASK>
>> [   22.979306]  ? show_regs+0x6d/0x80
>> [   22.987946]  intel_rapl_common
>> [   22.993089]  ? __die+0x29/0x70
>> [   22.993092]  ? page_fault_oops+0x15c/0x550
>> [   22.996110]  amd64_edac
>> [   23.017059]  ? do_user_addr_fault+0x47a/0x7e0
>> [   23.017062]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.022892]  edac_mce_amd
>> [   23.030838]  ? ZSTD_compressEnd_public+0x2c/0x170
>> [   23.030846]  ? exc_page_fault+0x7c/0x1b0
>> [   23.033278]  kvm_amd
>> [   23.041237]  ? asm_exc_page_fault+0x2b/0x30
>> [   23.041244]  ? krealloc_noprof+0x8f/0x300
>> [   23.049201]  kvm
>> [   23.057154]  ? zstd_compress_cctx+0x87/0xa0
>> [   23.057160]  aa_unpack+0x688/0x700
>> [   23.065120]  rapl
>> [   23.074145]  aa_replace_profiles+0x9e/0x1130
>> [   23.077257]  wmi_bmof
>> [   23.083666]  policy_update+0xd9/0x170
>> [   23.091629]  acpi_ipmi
>> [   23.094639]  profile_replace+0xb0/0x130
>> [   23.094642]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.097365]  ccp
>> [   23.099701]  vfs_write+0xf5/0x410
>> [   23.099706]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.099708]  ? putname+0x5b/0x70
>> [   23.103499]  k10temp
>> [   23.106897]  ksys_write+0x6b/0xf0
>> [   23.106901]  __x64_sys_write+0x1d/0x30
>> [   23.110305]  ipmi_si
>> [   23.114858]  x64_sys_call+0x1685/0x20d0
>> [   23.114865]  do_syscall_64+0x6f/0x110
>> [   23.117579]  ipmi_devintf
>> [   23.122427]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.122432]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.127775]  ipmi_msghandler
>> [   23.130688]  ? aa_file_perm+0x12f/0x500
>> [   23.130694]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.135945]  mac_hid
>> [   23.140312]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.140315]  ? do_syscall_64+0x7b/0x110
>> [   23.142752]  sch_fq_codel
>> [   23.147409]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.147412]  ? generic_file_read_iter+0xbf/0x110
>> [   23.151884]  dm_multipath
>> [   23.153915]  ? apparmor_file_permission+0x79/0x190
>> [   23.153919]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.158586]  scsi_dh_rdac
>> [   23.162360]  ? ext4_file_read_iter+0x5f/0x1e0
>> [   23.162366]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.164505]  scsi_dh_emc
>> [   23.169262]  ? vfs_read+0x259/0x340
>> [   23.169268]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.171799]  scsi_dh_alua
>> [   23.175866]  ? ksys_read+0x6b/0xf0
>> [   23.175870]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.175872]  ? syscall_exit_to_user_mode+0x57/0x1b0
>> [   23.178501]  msr
>> [   23.182762]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.182765]  ? do_syscall_64+0x7b/0x110
>> [   23.182767]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.182769]  ? do_user_addr_fault+0x55e/0x7e0
>> [   23.182772]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.188116]  efi_pstore
>> [   23.190155]  ? irqentry_exit_to_user_mode+0x33/0x170
>> [   23.190159]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.190160]  ? irqentry_exit+0x3f/0x50
>> [   23.193860]  ip_tables
>> [   23.199186]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   23.199193]  ? exc_page_fault+0x8d/0x1b0
>> [   23.202794]  x_tables
>> [   23.205223]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [   23.208919]  autofs4
>> [   23.213083] RIP: 0033:0x7f678db14887
>> [   23.213088] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
>> [   23.215526]  btrfs
>> [   23.219797] RSP: 002b:00007ffda7e7dc68 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
>> [   23.219802] RAX: ffffffffffffffda RBX: 000056055a182dc0 RCX: 00007f678db14887
>> [   23.219803] RDX: 00000000000050c1 RSI: 000056055a19e0b0 RDI: 0000000000000007
>> [   23.219804] RBP: 00000000000050c1 R08: 0000000000000000 R09: 000056055a19e0b0
>> [   23.219806] R10: 0000000000000000 R11: 0000000000000246 R12: 000056055a19e0b0
>> [   23.223890]  blake2b_generic
>> [   23.226802] R13: 00000000000050c1 R14: 000056051da91c5b R15: 0000000000000007
>> [   23.226809]  </TASK>
>> [   23.232152]  raid10
>> [   23.237488] Modules linked in: nls_iso8859_1 amd_atl intel_rapl_msr intel_rapl_common amd64_edac edac_mce_amd
>> [   23.240703]  raid456
>> [   23.244971]  kvm_amd kvm rapl wmi_bmof acpi_ipmi ccp k10temp ipmi_si
>> [   23.250320]  async_raid6_recov
>> [   23.252748]  ipmi_devintf ipmi_msghandler
>> [   23.258095]  async_memcpy
>> [   23.262363]  mac_hid sch_fq_codel dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua msr efi_pstore ip_tables
>> [   23.265285]  async_pq
>> [   23.270625]  x_tables autofs4 btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy
>> [   23.275780]  async_xor
>> [   23.278691]  async_pq async_xor async_tx xor raid6_pq raid1 raid0 ast drm_shmem_helper i2c_algo_bit drm_kms_helper crct10dif_pclmul
>> [   23.284046]  async_tx
>> [   23.289383]  crc32_pclmul ghash_clmulni_intel nvme sha256_ssse3 drm tg3 sha1_ssse3
>> [   23.292308]  xor
>> [   23.297157]  ahci i2c_piix4 nvme_core libahci i2c_smbus wmi aesni_intel crypto_simd cryptd
>> [   23.302509]  raid6_pq
>> [   23.305326] CR2: 000000000000001c
>> [   23.309217]  raid1
>> [   23.314552] ---[ end trace 0000000000000000 ]---
>> 
>> --
>> Regards
>> Narasimhan V
>> 
> 


