Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B2846E71D
	for <lists+linux-next@lfdr.de>; Thu,  9 Dec 2021 11:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236265AbhLIK5B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Dec 2021 05:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236369AbhLIK45 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Dec 2021 05:56:57 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDFFC061746;
        Thu,  9 Dec 2021 02:53:23 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id v1so18303905edx.2;
        Thu, 09 Dec 2021 02:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iZsEFBJtY2glm06aQA+lEYh7ZieBTyvjVDKJa0P+Mio=;
        b=OoomZe7Xzq/htw80ROAS3MTFq6b0mdDP2Ekb/QqAxaxTPx9ESvy4OiP2UdNK28rbVF
         tEHMf2bDeSLLmneOWRUHy+rgRbbZy+Ncg0IEOaF4LTNOfsOa+eL/87AMpgKVpEsL+RHF
         vnPoAwv7MgVNrIzj20fSPTw0qs4CKM+7re4WCpCK73mWxM29LJJ3hU/vYo2rnkqee4fZ
         dmMw0d0aAL/hwjaQdrCuVaTQ1DucXcn8KlRGT2dYcEX4NPn88RfNfaHkuDOe9NAUQe0k
         zXcs8gq3weWNDPenZEAevLV0GN6C/d2Gf+iPr4UPFmTZesd/jobjxtKAjwxPFivVl3P0
         3SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iZsEFBJtY2glm06aQA+lEYh7ZieBTyvjVDKJa0P+Mio=;
        b=pUUamrScfd3gjUq6XcsMJdj41MGBTAqLrEOaNygoeSoyCIgIS4EwJPCHLQscRbRGrD
         mCEQp+CBq0H0FkEg2Rva3GTzlGQ9GIZclbcjWJiCT0I2ohHSEbp0HrQQFy0IMqKjRuzx
         6XtXLfMB+8WSeGQhugpoKY+09qOdZaKCEef/aPsmhm5fWuNMhrqEUIpdwZIEfGPXrbNd
         TG7ajEsvdVSZiwAWD8WDaQy1wwirO2xI1hacSQuAUIp7Fn4vxKwuVaHsnWM7hNHRekam
         PKU0DW4CsA/VJwmOmQSFDjmp1KWY6Wrpkjc7fgpzXPJEpNU7sl4NSV29HxcUkxDI5qXd
         N0QQ==
X-Gm-Message-State: AOAM530TpYfTd1eE+CE+z2VtluZl1f1c5cottxf1Ops2XSSZIp82Lo/P
        QCUZsmykjJTmby2uaUjeQSboejErnvNuAf/8jyYETlFfw5V3zg==
X-Google-Smtp-Source: ABdhPJzl7mdIpEzjyu8vcmK878WEQoGyNK5f00PI/PjwJDgG1ecp99xbsOxeYTVYgHbZSAT0mXEGi2jA+9GeMlhF5qQ=
X-Received: by 2002:a17:907:608e:: with SMTP id ht14mr14806736ejc.120.1639047202058;
 Thu, 09 Dec 2021 02:53:22 -0800 (PST)
MIME-Version: 1.0
References: <CADJHv_u3bqj82sFUWT=JJBWd1kjc14FUbVBd_9r18cMQOeudJw@mail.gmail.com>
 <CANT5p=rjTGNu2WooxRcu4JMM9wSyYY6S3kXtdfQ5caj1WnAEOA@mail.gmail.com> <CANT5p=pW1t5ggVsrMgNWi+CBpym5XXQ1dSwm-eH=vpczmL_nTg@mail.gmail.com>
In-Reply-To: <CANT5p=pW1t5ggVsrMgNWi+CBpym5XXQ1dSwm-eH=vpczmL_nTg@mail.gmail.com>
From:   Shyam Prasad N <nspmangalore@gmail.com>
Date:   Thu, 9 Dec 2021 16:23:10 +0530
Message-ID: <CANT5p=oQeR90LPJKRUJ6eF+ti3Mefs48FfasT=fE79vyZKQU5g@mail.gmail.com>
Subject: Re: [ linux-next ] 20211206 tree cifs panic
To:     Murphy Zhou <jencce.kernel@gmail.com>,
        Steve French <smfrench@gmail.com>
Cc:     Linux-Next <linux-next@vger.kernel.org>,
        CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000003fdb4905d2b46a7b"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--0000000000003fdb4905d2b46a7b
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 9, 2021 at 3:06 PM Shyam Prasad N <nspmangalore@gmail.com> wrote:
>
> On Thu, Dec 9, 2021 at 2:40 PM Shyam Prasad N <nspmangalore@gmail.com> wrote:
> >
> > Hi Murphy,
> >
> > Can you please share the kernel config file used for this test?
> > Is cachefilesd configured on this test setup?
> >
> > Regards,
> > Shyam
> >
> > On Wed, Dec 8, 2021 at 2:57 PM Murphy Zhou <jencce.kernel@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > A connectathon test triggers panic like below. The server is a  smb
> > > share on the same server with the test client.
> > >
> > >
> > > [  594.061343] Key type cifs.spnego registered
> > > [  594.082337] Key type cifs.idmap registered
> > > [  594.104961] CIFS: No dialect specified on mount. Default has
> > > changed to a more secure dialect, SMB2.1 or later (e.g. SMB3.1.1),
> > > from CIFS (SMB1). To use the less secure SMB1 dialect to access old
> > > servers which do not support SMB3.1.1 (or even SMB3 or SMB2.1) specify
> > > vers=1.0 on mount.
> > > [  594.223460] CIFS: Attempting to mount \\hp-dl380pg8\testuser
> > > [  594.287771] BUG: kernel NULL pointer dereference, address: 0000000000000000
> > > [  594.319712] #PF: supervisor write access in kernel mode
> > > [  594.343627] #PF: error_code(0x0002) - not-present page
> > > [  594.366791] PGD 0 P4D 0
> > > [  594.378172] Oops: 0002 [#1] PREEMPT SMP PTI
> > > [  594.397047] CPU: 0 PID: 52196 Comm: mount.cifs Kdump: loaded
> > > Tainted: G          I       5.16.0-rc4-next-20211206 #1
> > > [  594.445144] Hardware name: HP ProLiant DL380p Gen8, BIOS P70 08/02/2014
> > > [  594.475201] RIP: 0010:cifs_fscache_get_inode_cookie+0x2f/0xb0 [cifs]
> > > [  594.503934] Code: 53 48 89 fb 48 83 ec 20 65 48 8b 04 25 28 00 00
> > > 00 48 89 44 24 18 48 8b 47 28 48 8b b8 88 03 00 00 e8 35 c6 fa ff 48
> > > 8b 53 68 <48> 89 14 25 00 00 00 00 48 8b 53 70 89 14 25 10 00 00 00 48
> > > 8b 53
> > > [  594.590004] RSP: 0018:ffffb93c4998fc10 EFLAGS: 00010282
> > > [  594.614861] RAX: ffff970743ab5000 RBX: ffff970411193168 RCX: 0000000000000000
> > > [  594.650920] RDX: 0000000061b01059 RSI: 00000000000041ed RDI: ffff970453924780
> > > [  594.686189] RBP: ffffb93c4998fce8 R08: ffff970411193168 R09: ffff970743ab1548
> > > [  594.718776] R10: 000000009f8bdc24 R11: 000000009053e561 R12: 000000000e1c25d9
> > > [  594.750925] R13: ffff970411193168 R14: ffff970743ab1000 R15: ffff970743ab5000
> > > [  594.783532] FS:  00007f2037080780(0000) GS:ffff97072f600000(0000)
> > > knlGS:0000000000000000
> > > [  594.820129] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  594.846183] CR2: 0000000000000000 CR3: 0000000141820006 CR4: 00000000001706f0
> > > [  594.878376] Call Trace:
> > > [  594.889469]  <TASK>
> > > [  594.898870]  cifs_iget+0x14b/0x160 [cifs]
> > > [  594.917781]  cifs_get_inode_info+0x430/0x750 [cifs]
> > > [  594.941267]  ? __d_instantiate+0x34/0xf0
> > > [  594.960012]  ? _raw_spin_unlock+0x16/0x30
> > > [  594.978111]  ? d_instantiate+0x3e/0x60
> > > [  594.994982]  cifs_root_iget+0x33b/0x4b0 [cifs]
> > > [  595.015099]  cifs_read_super+0x125/0x200 [cifs]
> > > [  595.035596]  cifs_smb3_do_mount+0x224/0x330 [cifs]
> > > [  595.057009]  smb3_get_tree+0x2d/0x50 [cifs]
> > > [  595.076065]  vfs_get_tree+0x25/0xb0
> > > [  595.092562]  do_new_mount+0x176/0x310
> > > [  595.110929]  __x64_sys_mount+0x103/0x140
> > > [  595.130439]  do_syscall_64+0x3b/0x90
> > > [  595.147929]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > [  595.172646] RIP: 0033:0x7f2037195c4e
> > > [  595.188703] Code: 48 8b 0d dd 71 0e 00 f7 d8 64 89 01 48 83 c8 ff
> > > c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00
> > > 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d aa 71 0e 00 f7 d8 64 89
> > > 01 48
> > > [  595.273644] RSP: 002b:00007fff27645a38 EFLAGS: 00000202 ORIG_RAX:
> > > 00000000000000a5
> > > [  595.307790] RAX: ffffffffffffffda RBX: 000055690a1bb910 RCX: 00007f2037195c4e
> > > [  595.340187] RDX: 0000556908d5946b RSI: 0000556908d594b6 RDI: 00007fff27647fbe
> > > [  595.372419] RBP: 000055690a1bb8f0 R08: 000055690a1bb910 R09: 0000000000000077
> > > [  595.404633] R10: 0000000000000000 R11: 0000000000000202 R12: 00007fff27647fb3
> > > [  595.436882] R13: 00007f203729d000 R14: 00007f203729f70e R15: 00007fff27647fbe
> > > [  595.468980]  </TASK>
> > > [  595.478769] Modules linked in: cifs cifs_arc4 cifs_md4 loop nfsv3
> > > rpcsec_gss_krb5 nfsv4 dns_resolver nfs fscache netfs rpcrdma rdma_cm
> > > iw_cm ib_cm ib_core nfsd auth_rpcgss nfs_acl lockd grace rfkill sunrpc
> > > intel_rapl_msr intel_rapl_common sb_edac x86_pkg_temp_thermal
> > > intel_powerclamp mgag200 coretemp i2c_algo_bit kvm_intel
> > > drm_shmem_helper drm_kms_helper ipmi_ssif iTCO_wdt kvm
> > > iTCO_vendor_support acpi_ipmi syscopyarea irqbypass sysfillrect
> > > ipmi_si rapl intel_cstate ioatdma ipmi_devintf sysimgblt intel_uncore
> > > fb_sys_fops cec lpc_ich ipmi_msghandler acpi_power_meter pcspkr dca
> > > hpilo drm fuse xfs libcrc32c sr_mod cdrom sd_mod ata_generic t10_pi sg
> > > ata_piix crct10dif_pclmul crc32_pclmul crc32c_intel libata serio_raw
> > > tg3 ghash_clmulni_intel hpsa hpwdt scsi_transport_sas dm_mirror
> > > dm_region_hash dm_log dm_mod
> > > [  595.821049] CR2: 0000000000000000
> >
> >
> >
> > --
> > Regards,
> > Shyam
>
> This does not repro against a Windows server.
> My suspicion is that the recent change of location of
> cifs_fscache_get_super_cookie to cifs_root_iget caused this. We maybe
> trying to initialize the inode cookie when the super cookie is yet to
> be initialized.
>
> The bigger point here is that there seems to be a circular dependency:
> We need tcon->resource_id to setup the super cookie. This is populated
> using inode number of root directory. Getting this inode number needs
> opening of the root dir. Open causes inode cookie to be initialized,
> which trips when it sees that the super cookie is still NULL.
>
> Steve: Do you agree with this assessment? How do we fix this? Can we
> use some other value for resource_id, and not have to rely on the root
> inode number? How about tcon->tid? Or a combination of tcon->tid and
> ses->Suid?
>
> --
> Regards,
> Shyam

Hi Murphy,

Will you be able to test out with this patch as a possible fix for this issue?

-- 
Regards,
Shyam

--0000000000003fdb4905d2b46a7b
Content-Type: application/octet-stream; 
	name="0001-cifs-use-tid-as-tcon-resource_id-for-fscache-super-c.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-use-tid-as-tcon-resource_id-for-fscache-super-c.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kwyudbz20>
X-Attachment-Id: f_kwyudbz20

RnJvbSA0MzY3ZTBiNzBjZTc0MTMwMWNjYTIyYzEzYjVlOTlkYmNhZGE5YzVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaHlhbSBQcmFzYWQgTiA8c3ByYXNhZEBtaWNyb3NvZnQuY29t
PgpEYXRlOiBXZWQsIDggRGVjIDIwMjEgMTY6MzM6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
aWZzOiB1c2UgdGlkIGFzIHRjb24gcmVzb3VyY2VfaWQgZm9yIGZzY2FjaGUgc3VwZXIgY29va2ll
CgpXZSBoYXZlIGEgY3ljbGljIGRlcGVuZGVuY3kgYmV0d2VlbiBmc2NhY2hlIHN1cGVyIGNvb2tp
ZQphbmQgcm9vdCBpbm9kZSBjb29raWUuIFRoZSBzdXBlciBjb29raWUgcmVsaWVzIG9uCnRjb24t
PnJlc291cmNlX2lkLCB3aGljaCBnZXRzIHBvcHVsYXRlZCBmcm9tIHRoZSByb290IGlub2RlCm51
bWJlci4gSG93ZXZlciwgZmV0Y2hpbmcgdGhlIHJvb3QgaW5vZGUgaW5pdGlhbGl6ZXMgaW5vZGUK
Y29va2llIGFzIGEgY2hpbGQgb2Ygc3VwZXIgY29va2llLCB3aGljaCBpcyB5ZXQgdG8gYmUgcG9w
dWxhdGVkLgoKQXMgYSBmaXgsIEknbSBtb3ZpbmcgdGhlIHN1cGVyIGNvb2tpZSBpbml0aWFsaXph
dGlvbiBiYWNrIGludG8KY2lmc19nZXRfdGNvbi4gSSBhbHNvIG1vdmVkIHRjb24tPnJlc291cmNl
X2lkIGluaXRpYWxpemF0aW9uCmJlZm9yZSB0aGF0LiBBbmQgcG9wdWxhdGluZyBpdCB3aXRoIHRj
b24tPnRpZCBpbnN0ZWFkIG9mCnVuaXF1ZWlkIG9mIHRoZSByb290IGlub2RlLiBOb3RlIHRoYXQg
dGlkIGNhbiBjb2xsaWRlIGJldHdlZW4KZGlmZmVyZW50IHNlcnZlcnMuIFNpbmNlIHRoZSBzdXBl
ciBjb29raWUgaXMgcGxhY2VkCnVuZGVyIGNsaWVudCBjb29raWUsIGl0IHNob3VsZCBiZSBnb29k
IGVub3VnaCBmb3Igbm93LgoKRml4ZXM6IDViZjkxZWYwM2Q5OCAoImNpZnM6IHdhaXQgZm9yIHRj
b24gcmVzb3VyY2VfaWQgYmVmb3JlIGdldHRpbmcgZnNjYWNoZSBzdXBlciIpCkNDOiBEYXZpZCBI
b3dlbGxzIDxkaG93ZWxsc0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTaHlhbSBQcmFzYWQg
TiA8c3ByYXNhZEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL2NpZnMvY29ubmVjdC5jIHwgMTIgKysr
KysrKysrKysrCiBmcy9jaWZzL2lub2RlLmMgICB8IDEzIC0tLS0tLS0tLS0tLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZnMvY2lmcy9jb25uZWN0LmMgYi9mcy9jaWZzL2Nvbm5lY3QuYwppbmRleCAxODQ0OGRiZDc2MmEu
LmVlOWY2ZDc1YzZmMSAxMDA2NDQKLS0tIGEvZnMvY2lmcy9jb25uZWN0LmMKKysrIGIvZnMvY2lm
cy9jb25uZWN0LmMKQEAgLTIzOTksNiArMjM5OSwxOCBAQCBjaWZzX2dldF90Y29uKHN0cnVjdCBj
aWZzX3NlcyAqc2VzLCBzdHJ1Y3Qgc21iM19mc19jb250ZXh0ICpjdHgpCiAJbGlzdF9hZGQoJnRj
b24tPnRjb25fbGlzdCwgJnNlcy0+dGNvbl9saXN0KTsKIAlzcGluX3VubG9jaygmY2lmc190Y3Bf
c2VzX2xvY2spOwogCisjaWZkZWYgQ09ORklHX0NJRlNfRlNDQUNIRQorCS8qIHBvcHVsYXRlIHRj
b24tPnJlc291cmNlX2lkICovCisJdGNvbi0+cmVzb3VyY2VfaWQgPSB0Y29uLT50aWQ7CisjZW5k
aWYKKworCS8qCisJICogVGhlIGNvb2tpZSBpcyBpbml0aWFsaXplZCBmcm9tIHZvbHVtZSBpbmZv
IHJldHVybmVkIGFib3ZlLgorCSAqIEluc2lkZSBjaWZzX2ZzY2FjaGVfZ2V0X3N1cGVyX2Nvb2tp
ZSBpdCBjaGVja3MKKwkgKiB0aGF0IHdlIGRvIG5vdCBnZXQgc3VwZXIgY29va2llIHR3aWNlLgor
CSAqLworCWNpZnNfZnNjYWNoZV9nZXRfc3VwZXJfY29va2llKHRjb24pOworCiAJcmV0dXJuIHRj
b247CiAKIG91dF9mYWlsOgpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9pbm9kZS5jIGIvZnMvY2lmcy9p
bm9kZS5jCmluZGV4IDk2ZDA4M2RiMTczNy4uMjc5NjIyZTRlYjFjIDEwMDY0NAotLS0gYS9mcy9j
aWZzL2lub2RlLmMKKysrIGIvZnMvY2lmcy9pbm9kZS5jCkBAIC0xMzU2LDExICsxMzU2LDYgQEAg
c3RydWN0IGlub2RlICpjaWZzX3Jvb3RfaWdldChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQogCQln
b3RvIG91dDsKIAl9CiAKLSNpZmRlZiBDT05GSUdfQ0lGU19GU0NBQ0hFCi0JLyogcG9wdWxhdGUg
dGNvbi0+cmVzb3VyY2VfaWQgKi8KLQl0Y29uLT5yZXNvdXJjZV9pZCA9IENJRlNfSShpbm9kZSkt
PnVuaXF1ZWlkOwotI2VuZGlmCi0KIAlpZiAocmMgJiYgdGNvbi0+cGlwZSkgewogCQljaWZzX2Ri
ZyhGWUksICJpcGMgY29ubmVjdGlvbiAtIGZha2UgcmVhZCBpbm9kZVxuIik7CiAJCXNwaW5fbG9j
aygmaW5vZGUtPmlfbG9jayk7CkBAIC0xMzc1LDE0ICsxMzcwLDYgQEAgc3RydWN0IGlub2RlICpj
aWZzX3Jvb3RfaWdldChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQogCQlpZ2V0X2ZhaWxlZChpbm9k
ZSk7CiAJCWlub2RlID0gRVJSX1BUUihyYyk7CiAJfQotCi0JLyoKLQkgKiBUaGUgY29va2llIGlz
IGluaXRpYWxpemVkIGZyb20gdm9sdW1lIGluZm8gcmV0dXJuZWQgYWJvdmUuCi0JICogSW5zaWRl
IGNpZnNfZnNjYWNoZV9nZXRfc3VwZXJfY29va2llIGl0IGNoZWNrcwotCSAqIHRoYXQgd2UgZG8g
bm90IGdldCBzdXBlciBjb29raWUgdHdpY2UuCi0JICovCi0JY2lmc19mc2NhY2hlX2dldF9zdXBl
cl9jb29raWUodGNvbik7Ci0KIG91dDoKIAlrZnJlZShwYXRoKTsKIAlmcmVlX3hpZCh4aWQpOwot
LSAKMi4zMi4wCgo=
--0000000000003fdb4905d2b46a7b--
