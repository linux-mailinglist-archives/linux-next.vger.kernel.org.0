Return-Path: <linux-next+bounces-1532-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B881B8755EE
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 19:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F41EB246AF
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 18:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4C213175C;
	Thu,  7 Mar 2024 18:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmJxo4rB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2358012C81E;
	Thu,  7 Mar 2024 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709835396; cv=none; b=dmZ3/YlY3pvxwDNnCTP1UaGnIU2NQv48zn9XMmcD2Sni5Pu0uSmmWUglRhxgrqmFAUKmDgXpJRmxTHbvdGd4EZ3j+2KBjR1z4Ji2YOLM83q0Hrk2vpygrgzPIzt2i3YB5EQn1TcE7SwL4W/itsH+y5fvQdhg7tb+8wehq6eLD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709835396; c=relaxed/simple;
	bh=0r7bLhDQPjxmR+E62vUErznSiYClcqYwwCjCI1sE/yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPmUbFEZFa6F8zIzr+Iu37SoGxGQTPs+DKmOSSjZtOEE5qAURlF3RYoa97IdLsIxArJ/YDtnhs7M9nT/qhW+mu7H4fnoIdcVvCu9HzVcAuRHHBJkLcQBNsA5SB07XEb88NUs2M+QTdr3FVdaoOPvY+q52mG9c+ZH7I2+RVR+Kpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmJxo4rB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A4EC43390;
	Thu,  7 Mar 2024 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709835395;
	bh=0r7bLhDQPjxmR+E62vUErznSiYClcqYwwCjCI1sE/yg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bmJxo4rBMcDZtvMb4Op7PB1QSTaoL2sKoFfwMZLMJS4jzrIMHBa7s/fPzXWlyB7cG
	 6YNlV0KaSQFvo9XzSAkBqx8QyjndgvBgJhwMW55VZEuW8//N9TD+4hdk/Ez2KTnHLu
	 65K+dtcCRnf6adctcLqTehZA2tyWwdOGm/NfqF4vm7RxwW7OGjMDvMvnn/4J3hXbef
	 jVyzdb0k+zNQZwMZRI2qi25KP44Fsd8ecb/58qaDIHwZz/gnyWp+mnfZRofU4oKKwv
	 TMkNt76dckW6HnXNwdm4SSshr84wXl8KuJl2LDz7D4ShT3iEK+kUwxFvrgcjpZafYp
	 Y7LuZIfsEHVYg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so15999441fa.3;
        Thu, 07 Mar 2024 10:16:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVwUg3IeLS+LxpuECRvhDnBkH9oilJFc5z3VuQ1oQB3HWqc0svLoAZGOhdj56bxeBPVum+rryNflWMH/n3tBIZGmKbr1IJVSQgpipf3KLy6rSvPwdQxW7HMwonp6S7CA==
X-Gm-Message-State: AOJu0YzXaKCLSlIOuSMuGVblT0cJz6eGjP14jsXpqlfi8yW0RDmxjwrk
	HksVNHbXO7LiJaEeKVm2wR3lCdLWFgdupjlXRusInKqxmC1/j0TedaNRGaenbP4MWlm2iiffK3x
	c+2s2GFbbb8rjG+yPlNmp5SHnaHQ=
X-Google-Smtp-Source: AGHT+IHSYtgXzKgQ/AEZx62O/qmj4o+j2hHR2LS+fohaeKLnI0y0tkEPNyAKJi6LNuNC8vVWqlZAqcJB+JBc3TzdqAw=
X-Received: by 2002:a2e:7c01:0:b0:2d2:c82c:b822 with SMTP id
 x1-20020a2e7c01000000b002d2c82cb822mr1691031ljc.22.1709835393505; Thu, 07 Mar
 2024 10:16:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <65e9e748.a70a0220.606f7.53c0@mx.google.com> <7e216c88-77ee-47b8-becc-a0f780868d3c@sirena.org.uk>
In-Reply-To: <7e216c88-77ee-47b8-becc-a0f780868d3c@sirena.org.uk>
From: Song Liu <song@kernel.org>
Date: Thu, 7 Mar 2024 10:16:21 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7c+OgFcZ9qWF7nes3SbaQdf5GYZZA+jyHAOzJ5omuZ8g@mail.gmail.com>
Message-ID: <CAPhsuW7c+OgFcZ9qWF7nes3SbaQdf5GYZZA+jyHAOzJ5omuZ8g@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on qemu_arm64-virt-gicv3-uefi
To: Mark Brown <broonie@kernel.org>
Cc: Puranjay Mohan <puranjay12@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, kernelci-results@groups.io, 
	bot@kernelci.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	bpf@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 8:36=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Mar 07, 2024 at 08:12:00AM -0800, KernelCI bot wrote:
>
> The KernelCI bisection bot found a boot regression n today's -next on
> qemu arm64 UEFI platforms with 64K pages which was bisected to commit
> 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management").
> We OOM quite early in boot:

IIUC, 64kB pages means 512MB PMD. I think that's indeed too big. We
will need some logic to limit such cases.

Song

>
> <6>[    0.174998] DMI: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
> <4>[    0.189015] swapper/0 invoked oom-killer: gfp_mask=3D0x2cc2(GFP_KER=
NEL|__GFP_HIGHMEM|__GFP_NOWARN), order=3D0, oom_score_adj=3D0
> <4>[    0.189835] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.8.0-rc7-nex=
t-20240307 #1
> <4>[    0.190093] Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02=
/06/2015
>
> ...
>
>
> <4>[    0.192209]  vmalloc+0x84/0x94
> <4>[    0.192301]  bpf_jit_alloc_exec+0x10/0x1c
> <4>[    0.192402]  bpf_prog_pack_alloc+0x120/0x26c
> <4>[    0.192505]  bpf_jit_binary_pack_alloc+0x6c/0x128
> <4>[    0.192611]  bpf_int_jit_compile+0x5f4/0x69c
> <4>[    0.192718]  bpf_prog_select_runtime+0x11c/0x194
> <4>[    0.192832]  bpf_migrate_filter+0x120/0x164
> <4>[    0.192940]  bpf_prog_create+0x124/0x154
> <4>[    0.193045]  ptp_classifier_init+0x40/0x70
> <4>[    0.193152]  sock_init+0xa4/0xbc
>
> It just seems to be these platforms that are affected, the same
> platforms without UEFI are fine and no other platforms seem to be
> showing similar behaviour.  A full log from one of the failed boots can
> be seen here:
>
>    https://storage.kernelci.org/next/master/next-20240307/arm64/defconfig=
+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gic=
v2-uefi.txt
>
> I've left the full report from the bot below, including links to other
> boot logs and further information as well as a Reported-by for the bot.
>
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> > * This automated bisection report was sent to you on the basis  *
> > * that you may be involved with the breaking commit it has      *
> > * found.  No manual investigation has been done to verify it,   *
> > * and the root cause of the problem may be somewhere else.      *
> > *                                                               *
> > * If you do send a fix, please include this trailer:            *
> > *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> > *                                                               *
> > * Hope this helps!                                              *
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> >
> > next/master bisection: baseline.login on qemu_arm64-virt-gicv3-uefi
> >
> > Summary:
> >   Start:      1843e16d2df9 Add linux-next specific files for 20240307
> >   Plain log:  https://storage.kernelci.org/next/master/next-20240307/ar=
m64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
> >   HTML log:   https://storage.kernelci.org/next/master/next-20240307/ar=
m64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.html
> >   Result:     1dad391daef1 bpf, arm64: use bpf_prog_pack for memory man=
agement
> >
> > Checks:
> >   revert:     PASS
> >   verify:     PASS
> >
> > Parameters:
> >   Tree:       next
> >   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linu=
x-next.git
> >   Branch:     master
> >   Target:     qemu_arm64-virt-gicv3-uefi
> >   CPU arch:   arm64
> >   Lab:        lab-collabora
> >   Compiler:   gcc-10
> >   Config:     defconfig+CONFIG_ARM64_64K_PAGES=3Dy
> >   Test case:  baseline.login
> >
> > Breaking commit found:
> >
> > -----------------------------------------------------------------------=
--------
> > commit 1dad391daef129e01e28206b8d586608ff026548
> > Author: Puranjay Mohan <puranjay12@gmail.com>
> > Date:   Wed Feb 28 14:18:24 2024 +0000
> >
> >     bpf, arm64: use bpf_prog_pack for memory management
> >
> >     Use bpf_jit_binary_pack_alloc for memory management of JIT binaries=
 in
> >     ARM64 BPF JIT. The bpf_jit_binary_pack_alloc creates a pair of RW a=
nd RX
> >     buffers. The JIT writes the program into the RW buffer. When the JI=
T is
> >     done, the program is copied to the final RX buffer
> >     with bpf_jit_binary_pack_finalize.
> >
> >     Implement bpf_arch_text_copy() and bpf_arch_text_invalidate() for A=
RM64
> >     JIT as these functions are required by bpf_jit_binary_pack allocato=
r.
> >
> >     Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> >     Acked-by: Song Liu <song@kernel.org>
> >     Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> >     Link: https://lore.kernel.org/r/20240228141824.119877-3-puranjay12@=
gmail.com
> >     Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> >
> > diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_com=
p.c
> > index 20720ec346b8..5afc7a525eca 100644
> > --- a/arch/arm64/net/bpf_jit_comp.c
> > +++ b/arch/arm64/net/bpf_jit_comp.c
> > @@ -76,6 +76,7 @@ struct jit_ctx {
> >       int *offset;
> >       int exentry_idx;
> >       __le32 *image;
> > +     __le32 *ro_image;
> >       u32 stack_size;
> >       int fpb_offset;
> >  };
> > @@ -205,6 +206,14 @@ static void jit_fill_hole(void *area, unsigned int=
 size)
> >               *ptr++ =3D cpu_to_le32(AARCH64_BREAK_FAULT);
> >  }
> >
> > +int bpf_arch_text_invalidate(void *dst, size_t len)
> > +{
> > +     if (!aarch64_insn_set(dst, AARCH64_BREAK_FAULT, len))
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +
> >  static inline int epilogue_offset(const struct jit_ctx *ctx)
> >  {
> >       int to =3D ctx->epilogue_offset;
> > @@ -746,7 +755,8 @@ static int add_exception_handler(const struct bpf_i=
nsn *insn,
> >                                struct jit_ctx *ctx,
> >                                int dst_reg)
> >  {
> > -     off_t offset;
> > +     off_t ins_offset;
> > +     off_t fixup_offset;
> >       unsigned long pc;
> >       struct exception_table_entry *ex;
> >
> > @@ -763,12 +773,17 @@ static int add_exception_handler(const struct bpf=
_insn *insn,
> >               return -EINVAL;
> >
> >       ex =3D &ctx->prog->aux->extable[ctx->exentry_idx];
> > -     pc =3D (unsigned long)&ctx->image[ctx->idx - 1];
> > +     pc =3D (unsigned long)&ctx->ro_image[ctx->idx - 1];
> >
> > -     offset =3D pc - (long)&ex->insn;
> > -     if (WARN_ON_ONCE(offset >=3D 0 || offset < INT_MIN))
> > +     /*
> > +      * This is the relative offset of the instruction that may fault =
from
> > +      * the exception table itself. This will be written to the except=
ion
> > +      * table and if this instruction faults, the destination register=
 will
> > +      * be set to '0' and the execution will jump to the next instruct=
ion.
> > +      */
> > +     ins_offset =3D pc - (long)&ex->insn;
> > +     if (WARN_ON_ONCE(ins_offset >=3D 0 || ins_offset < INT_MIN))
> >               return -ERANGE;
> > -     ex->insn =3D offset;
> >
> >       /*
> >        * Since the extable follows the program, the fixup offset is alw=
ays
> > @@ -777,12 +792,25 @@ static int add_exception_handler(const struct bpf=
_insn *insn,
> >        * bits. We don't need to worry about buildtime or runtime sort
> >        * modifying the upper bits because the table is already sorted, =
and
> >        * isn't part of the main exception table.
> > +      *
> > +      * The fixup_offset is set to the next instruction from the instr=
uction
> > +      * that may fault. The execution will jump to this after handling=
 the
> > +      * fault.
> >        */
> > -     offset =3D (long)&ex->fixup - (pc + AARCH64_INSN_SIZE);
> > -     if (!FIELD_FIT(BPF_FIXUP_OFFSET_MASK, offset))
> > +     fixup_offset =3D (long)&ex->fixup - (pc + AARCH64_INSN_SIZE);
> > +     if (!FIELD_FIT(BPF_FIXUP_OFFSET_MASK, fixup_offset))
> >               return -ERANGE;
> >
> > -     ex->fixup =3D FIELD_PREP(BPF_FIXUP_OFFSET_MASK, offset) |
> > +     /*
> > +      * The offsets above have been calculated using the RO buffer but=
 we
> > +      * need to use the R/W buffer for writes.
> > +      * switch ex to rw buffer for writing.
> > +      */
> > +     ex =3D (void *)ctx->image + ((void *)ex - (void *)ctx->ro_image);
> > +
> > +     ex->insn =3D ins_offset;
> > +
> > +     ex->fixup =3D FIELD_PREP(BPF_FIXUP_OFFSET_MASK, fixup_offset) |
> >                   FIELD_PREP(BPF_FIXUP_REG_MASK, dst_reg);
> >
> >       ex->type =3D EX_TYPE_BPF;
> > @@ -1550,7 +1578,8 @@ static inline void bpf_flush_icache(void *start, =
void *end)
> >
> >  struct arm64_jit_data {
> >       struct bpf_binary_header *header;
> > -     u8 *image;
> > +     u8 *ro_image;
> > +     struct bpf_binary_header *ro_header;
> >       struct jit_ctx ctx;
> >  };
> >
> > @@ -1559,12 +1588,14 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf=
_prog *prog)
> >       int image_size, prog_size, extable_size, extable_align, extable_o=
ffset;
> >       struct bpf_prog *tmp, *orig_prog =3D prog;
> >       struct bpf_binary_header *header;
> > +     struct bpf_binary_header *ro_header;
> >       struct arm64_jit_data *jit_data;
> >       bool was_classic =3D bpf_prog_was_classic(prog);
> >       bool tmp_blinded =3D false;
> >       bool extra_pass =3D false;
> >       struct jit_ctx ctx;
> >       u8 *image_ptr;
> > +     u8 *ro_image_ptr;
> >
> >       if (!prog->jit_requested)
> >               return orig_prog;
> > @@ -1591,8 +1622,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_=
prog *prog)
> >       }
> >       if (jit_data->ctx.offset) {
> >               ctx =3D jit_data->ctx;
> > -             image_ptr =3D jit_data->image;
> > +             ro_image_ptr =3D jit_data->ro_image;
> > +             ro_header =3D jit_data->ro_header;
> >               header =3D jit_data->header;
> > +             image_ptr =3D (void *)header + ((void *)ro_image_ptr
> > +                                              - (void *)ro_header);
> >               extra_pass =3D true;
> >               prog_size =3D sizeof(u32) * ctx.idx;
> >               goto skip_init_ctx;
> > @@ -1637,18 +1671,27 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf=
_prog *prog)
> >       /* also allocate space for plt target */
> >       extable_offset =3D round_up(prog_size + PLT_TARGET_SIZE, extable_=
align);
> >       image_size =3D extable_offset + extable_size;
> > -     header =3D bpf_jit_binary_alloc(image_size, &image_ptr,
> > -                                   sizeof(u32), jit_fill_hole);
> > -     if (header =3D=3D NULL) {
> > +     ro_header =3D bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr=
,
> > +                                           sizeof(u32), &header, &imag=
e_ptr,
> > +                                           jit_fill_hole);
> > +     if (!ro_header) {
> >               prog =3D orig_prog;
> >               goto out_off;
> >       }
> >
> >       /* 2. Now, the actual pass. */
> >
> > +     /*
> > +      * Use the image(RW) for writing the JITed instructions. But also=
 save
> > +      * the ro_image(RX) for calculating the offsets in the image. The=
 RW
> > +      * image will be later copied to the RX image from where the prog=
ram
> > +      * will run. The bpf_jit_binary_pack_finalize() will do this copy=
 in the
> > +      * final step.
> > +      */
> >       ctx.image =3D (__le32 *)image_ptr;
> > +     ctx.ro_image =3D (__le32 *)ro_image_ptr;
> >       if (extable_size)
> > -             prog->aux->extable =3D (void *)image_ptr + extable_offset=
;
> > +             prog->aux->extable =3D (void *)ro_image_ptr + extable_off=
set;
> >  skip_init_ctx:
> >       ctx.idx =3D 0;
> >       ctx.exentry_idx =3D 0;
> > @@ -1656,9 +1699,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
> >       build_prologue(&ctx, was_classic, prog->aux->exception_cb);
> >
> >       if (build_body(&ctx, extra_pass)) {
> > -             bpf_jit_binary_free(header);
> >               prog =3D orig_prog;
> > -             goto out_off;
> > +             goto out_free_hdr;
> >       }
> >
> >       build_epilogue(&ctx, prog->aux->exception_cb);
> > @@ -1666,34 +1708,44 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf=
_prog *prog)
> >
> >       /* 3. Extra pass to validate JITed code. */
> >       if (validate_ctx(&ctx)) {
> > -             bpf_jit_binary_free(header);
> >               prog =3D orig_prog;
> > -             goto out_off;
> > +             goto out_free_hdr;
> >       }
> >
> >       /* And we're done. */
> >       if (bpf_jit_enable > 1)
> >               bpf_jit_dump(prog->len, prog_size, 2, ctx.image);
> >
> > -     bpf_flush_icache(header, ctx.image + ctx.idx);
> > -
> >       if (!prog->is_func || extra_pass) {
> >               if (extra_pass && ctx.idx !=3D jit_data->ctx.idx) {
> >                       pr_err_once("multi-func JIT bug %d !=3D %d\n",
> >                                   ctx.idx, jit_data->ctx.idx);
> > -                     bpf_jit_binary_free(header);
> >                       prog->bpf_func =3D NULL;
> >                       prog->jited =3D 0;
> >                       prog->jited_len =3D 0;
> > +                     goto out_free_hdr;
> > +             }
> > +             if (WARN_ON(bpf_jit_binary_pack_finalize(prog, ro_header,
> > +                                                      header))) {
> > +                     /* ro_header has been freed */
> > +                     ro_header =3D NULL;
> > +                     prog =3D orig_prog;
> >                       goto out_off;
> >               }
> > -             bpf_jit_binary_lock_ro(header);
> > +             /*
> > +              * The instructions have now been copied to the ROX regio=
n from
> > +              * where they will execute. Now the data cache has to be =
cleaned to
> > +              * the PoU and the I-cache has to be invalidated for the =
VAs.
> > +              */
> > +             bpf_flush_icache(ro_header, ctx.ro_image + ctx.idx);
> >       } else {
> >               jit_data->ctx =3D ctx;
> > -             jit_data->image =3D image_ptr;
> > +             jit_data->ro_image =3D ro_image_ptr;
> >               jit_data->header =3D header;
> > +             jit_data->ro_header =3D ro_header;
> >       }
> > -     prog->bpf_func =3D (void *)ctx.image;
> > +
> > +     prog->bpf_func =3D (void *)ctx.ro_image;
> >       prog->jited =3D 1;
> >       prog->jited_len =3D prog_size;
> >
> > @@ -1714,6 +1766,14 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_=
prog *prog)
> >               bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ?
> >                                          tmp : orig_prog);
> >       return prog;
> > +
> > +out_free_hdr:
> > +     if (header) {
> > +             bpf_arch_text_copy(&ro_header->size, &header->size,
> > +                                sizeof(header->size));
> > +             bpf_jit_binary_pack_free(ro_header, header);
> > +     }
> > +     goto out_off;
> >  }
> >
> >  bool bpf_jit_supports_kfunc_call(void)
> > @@ -1721,6 +1781,13 @@ bool bpf_jit_supports_kfunc_call(void)
> >       return true;
> >  }
> >
> > +void *bpf_arch_text_copy(void *dst, void *src, size_t len)
> > +{
> > +     if (!aarch64_insn_copy(dst, src, len))
> > +             return ERR_PTR(-EINVAL);
> > +     return dst;
> > +}
> > +
> >  u64 bpf_jit_alloc_exec_limit(void)
> >  {
> >       return VMALLOC_END - VMALLOC_START;
> > @@ -2359,3 +2426,27 @@ bool bpf_jit_supports_exceptions(void)
> >        */
> >       return true;
> >  }
> > +
> > +void bpf_jit_free(struct bpf_prog *prog)
> > +{
> > +     if (prog->jited) {
> > +             struct arm64_jit_data *jit_data =3D prog->aux->jit_data;
> > +             struct bpf_binary_header *hdr;
> > +
> > +             /*
> > +              * If we fail the final pass of JIT (from jit_subprogs),
> > +              * the program may not be finalized yet. Call finalize he=
re
> > +              * before freeing it.
> > +              */
> > +             if (jit_data) {
> > +                     bpf_arch_text_copy(&jit_data->ro_header->size, &j=
it_data->header->size,
> > +                                        sizeof(jit_data->header->size)=
);
> > +                     kfree(jit_data);
> > +             }
> > +             hdr =3D bpf_jit_binary_pack_hdr(prog);
> > +             bpf_jit_binary_pack_free(hdr, NULL);
> > +             WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(prog));
> > +     }
> > +
> > +     bpf_prog_unlock_free(prog);
> > +}
> > -----------------------------------------------------------------------=
--------
> >
> >
> > Git bisection log:
> >
> > -----------------------------------------------------------------------=
--------
> > git bisect start
> > # good: [67be068d31d423b857ffd8c34dbcc093f8dfff76] Merge tag 'vfs-6.8-r=
elease.fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
> > git bisect good 67be068d31d423b857ffd8c34dbcc093f8dfff76
> > # bad: [1843e16d2df9d98427ef8045589571749d627cf7] Add linux-next specif=
ic files for 20240307
> > git bisect bad 1843e16d2df9d98427ef8045589571749d627cf7
> > # bad: [1a0a33e22e715a4cc7bb2709cfda8e83b8c756b2] Merge branch 'main' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> > git bisect bad 1a0a33e22e715a4cc7bb2709cfda8e83b8c756b2
> > # good: [5a0d6b0465ab18fefa8abc9afbabce19e7de2fe5] Merge branch 'nfsd-n=
ext' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
> > git bisect good 5a0d6b0465ab18fefa8abc9afbabce19e7de2fe5
> > # good: [a5fcf74d80bec9948701ff0f7529ae96a0c4a41c] inet: annotate data-=
races around ifa->ifa_valid_lft
> > git bisect good a5fcf74d80bec9948701ff0f7529ae96a0c4a41c
> > # good: [7aaab3e1fcee995b70d344687fa0f33b0b9d33f7] Merge branch 'hwmon-=
next' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging=
.git
> > git bisect good 7aaab3e1fcee995b70d344687fa0f33b0b9d33f7
> > # good: [dfa2c103738019033bad44d8be7919ad8bc19dd6] Merge branch 'linux-=
next' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
> > git bisect good dfa2c103738019033bad44d8be7919ad8bc19dd6
> > # bad: [564ae6794ec5f050bb6df4446820777e7253f960] mptcp: get addr in us=
erspace pm list
> > git bisect bad 564ae6794ec5f050bb6df4446820777e7253f960
> > # good: [2c21a0f67c8ce334b8a58332e8c2d71694bef0ab] Merge branch 'Suppor=
t PTR_MAYBE_NULL for struct_ops arguments.'
> > git bisect good 2c21a0f67c8ce334b8a58332e8c2d71694bef0ab
> > # bad: [4ab597d2962195ca4f01a429f9b2ea87ee684be3] net: bareudp: Remove =
generic .ndo_get_stats64
> > git bisect bad 4ab597d2962195ca4f01a429f9b2ea87ee684be3
> > # good: [dfe6625df48ec54c6dc9b86d361f26962d09de88] bpf: introduce in_sl=
eepable() helper
> > git bisect good dfe6625df48ec54c6dc9b86d361f26962d09de88
> > # bad: [f2e81192e07e87897ff1296c96775eceea8f582a] bpftool: Add an examp=
le for struct_ops map and shadow type.
> > git bisect bad f2e81192e07e87897ff1296c96775eceea8f582a
> > # bad: [1dad391daef129e01e28206b8d586608ff026548] bpf, arm64: use bpf_p=
rog_pack for memory management
> > git bisect bad 1dad391daef129e01e28206b8d586608ff026548
> > # good: [22fc0e80aeb5c0c1377e6c02d7248f8fbf5df7fc] bpf, arm64: support =
exceptions
> > git bisect good 22fc0e80aeb5c0c1377e6c02d7248f8fbf5df7fc
> > # good: [451c3cab9a65e656c3b3d106831fc02d56b8c34a] arm64: patching: imp=
lement text_poke API
> > git bisect good 451c3cab9a65e656c3b3d106831fc02d56b8c34a
> > # first bad commit: [1dad391daef129e01e28206b8d586608ff026548] bpf, arm=
64: use bpf_prog_pack for memory management
> > -----------------------------------------------------------------------=
--------
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Groups.io Links: You receive all messages sent to this group.
> > View/Reply Online (#52295): https://groups.io/g/kernelci-results/messag=
e/52295
> > Mute This Topic: https://groups.io/mt/104790392/1131744
> > Group Owner: kernelci-results+owner@groups.io
> > Unsubscribe: https://groups.io/g/kernelci-results/unsub [broonie@kernel=
.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >

